Received: by 10.25.0.144 with SMTP id 138csp120889lfa;
        Tue, 11 Apr 2017 20:46:56 -0700 (PDT)
X-Received: by 10.55.146.135 with SMTP id u129mr57694690qkd.219.1491968816788;
        Tue, 11 Apr 2017 20:46:56 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id p206si18293005qke.7.2017.04.11.20.46.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 20:46:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com
Received: from int-mx11.intmail.prod.int.phx2.redhat.com (int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9EC58D1FC5;
	Wed, 12 Apr 2017 03:46:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9EC58D1FC5
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9EC58D1FC5
Received: from [10.72.8.56] (ovpn-8-56.pek2.redhat.com [10.72.8.56])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id v3C3kmJu030332
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 11 Apr 2017 23:46:50 -0400
Subject: Re: [PATCH 10/10] tb-hash: improve tb_jmp_cache hash function in user
 mode
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
References: <1491959850-30756-1-git-send-email-cota@braap.org>
 <1491959850-30756-11-git-send-email-cota@braap.org>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>,
        Richard Henderson <rth@twiddle.net>,
        Peter Maydell
 <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Claudio Fontana <claudio.fontana@huawei.com>,
        Andrzej Zaborowski <balrogg@gmail.com>,
        Aurelien Jarno
 <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>,
        Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org,
        alex.bennee@linaro.org, Pranith Kumar <bobby.prani+qemu@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <93ae643a-582f-8f1a-3f2a-63ae2d9261bc@redhat.com>
Date: Wed, 12 Apr 2017 11:46:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1491959850-30756-11-git-send-email-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]); Wed, 12 Apr 2017 03:46:55 +0000 (UTC)
X-TUID: 9LK2UydB2CQa



On 12/04/2017 09:17, Emilio G. Cota wrote:
> +
> +/* In user-mode we can get better hashing because we do not have a TLB */
> +static inline unsigned int tb_jmp_cache_hash_func(target_ulong pc)
> +{
> +    return (pc ^ (pc >> TB_JMP_CACHE_BITS)) & (TB_JMP_CACHE_SIZE - 1);
> +}

What about multiplicative hashing?

	return (uint64_t) (pc * 2654435761) >> 32;

Paolo
