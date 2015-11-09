Received: by 10.182.105.169 with SMTP id gn9csp1087033obb;
        Mon, 9 Nov 2015 02:56:23 -0800 (PST)
X-Received: by 10.129.34.131 with SMTP id i125mr23541030ywi.186.1447066581496;
        Mon, 09 Nov 2015 02:56:21 -0800 (PST)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p2si7156322ywb.232.2015.11.09.02.56.21
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Nov 2015 02:56:21 -0800 (PST)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id B2E3C461D7;
	Mon,  9 Nov 2015 10:56:20 +0000 (UTC)
Received: from [10.36.112.64] (ovpn-112-64.ams2.redhat.com [10.36.112.64])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id tA9AuFrd013316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 9 Nov 2015 05:56:18 -0500
Subject: Re: [PATCH 12/16] qom/cpu: Add MemoryRegion property
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1446747358-18214-1-git-send-email-peter.maydell@linaro.org>
 <1446747358-18214-13-git-send-email-peter.maydell@linaro.org>
Cc: patches@linaro.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>,
        "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
        =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>,
        qemu-arm@nongnu.org
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56407BCF.3070307@redhat.com>
Date: Mon, 9 Nov 2015 11:56:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.3.0
MIME-Version: 1.0
In-Reply-To: <1446747358-18214-13-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-TUID: KyeC8K1RT9BB



On 05/11/2015 19:15, Peter Maydell wrote:
> +
> +    /* This is a softmmu CPU object, so create a property for it
> +     * so users can wire up its memory. (This can't go in qom/cpu.c
> +     * because that file is compiled only once for both user-mode
> +     * and system builds.) The default if no link is set up is to use
> +     * the system address space.
> +     */
> +    object_property_add_link(OBJECT(cpu), "memory", TYPE_MEMORY_REGION,
> +                             (Object **)&cpu->memory,
> +                             qdev_prop_allow_set_link_before_realize,
> +                             OBJ_PROP_LINK_UNREF_ON_RELEASE,
> +                             &error_abort);
> +    cpu->memory = system_memory;

You need object_ref(cpu->memory) here, because setting cpu->memory will
drop a reference from the previously-set value.

Paolo

>  #endif
