Received: by 10.182.105.169 with SMTP id gn9csp1086707obb;
        Mon, 9 Nov 2015 02:55:36 -0800 (PST)
X-Received: by 10.129.70.197 with SMTP id t188mr22437793ywa.292.1447066536410;
        Mon, 09 Nov 2015 02:55:36 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id e3si7147792ywf.297.2015.11.09.02.55.36
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 02:55:36 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx10.intmail.prod.int.phx2.redhat.com (int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 92D2D8F4E4;
	Mon,  9 Nov 2015 10:55:35 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id tA9AtUb1020145
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 9 Nov 2015 05:55:33 -0500
Subject: Re: [PATCH 11/16] memory: Add address_space_init_shareable()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-12-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        qemu-arm@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56407BA1.3070304@redhat.com>
Date: Mon, 9 Nov 2015 11:55:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446747358-18214-12-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-TUID: dsoExkvI0K3V



On 05/11/2015 19:15, Peter Maydell wrote:
> +AddressSpace *address_space_init_shareable(MemoryRegion *root, const char *name)
> +{
> +    AddressSpace *as;
> +
> +    QTAILQ_FOREACH(as, &address_spaces, address_spaces_link) {
> +        if (root == as->root) {
> +            as->ref_count++;
> +            return as;
> +        }
> +    }
> +
> +    as = g_malloc0(sizeof *as);
> +    address_space_init(as, root, name);
> +    as->malloced = true;
> +    return as;
>  }

You shouldn't return a non-shareable address space here, I think,
because it might be contained into another object and that object might
disappear.  I haven't thought this through very much, but adding an " &&
as->malloced" to the conditional seems easy and safe.

Paolo

>  
>  void address_space_destroy(AddressSpace *as)
>  {
>      MemoryRegion *root = as->root;
>  
> +    as->ref_count--;
> +    if (as->ref_count) {
> +        return;
> +    }
>      /* Flush out anything from MemoryListeners listening in on this */
>      memory_region_transaction_begin();
>      as->root = NULL;
> 
