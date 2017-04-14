Received: by 10.25.0.144 with SMTP id 138csp136126lfa;
        Thu, 13 Apr 2017 22:17:58 -0700 (PDT)
X-Received: by 10.200.34.162 with SMTP id f31mr5409044qta.65.1492147078698;
        Thu, 13 Apr 2017 22:17:58 -0700 (PDT)
Return-Path: <pbonzini@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id 21si865778qkj.172.2017.04.13.22.17.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 13 Apr 2017 22:17:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of pbonzini@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=pbonzini@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx16.intmail.prod.int.phx2.redhat.com [10.5.11.28])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BB592C04B32C;
	Fri, 14 Apr 2017 05:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BB592C04B32C
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com; dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com; spf=pass smtp.mailfrom=pbonzini@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BB592C04B32C
Received: from [10.72.8.65] (ovpn-8-65.pek2.redhat.com [10.72.8.65])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 75DD82D653;
	Fri, 14 Apr 2017 05:17:51 +0000 (UTC)
Subject: Re: [PATCH 09/10] target/i386: optimize indirect branches with TCG's
 jr op
To: "Emilio G. Cota" <cota@braap.org>
References: <1491959850-30756-1-git-send-email-cota@braap.org>
 <1491959850-30756-10-git-send-email-cota@braap.org>
 <2ede0852-6888-8bcb-ac5a-363478841bc7@redhat.com>
 <20170413014646.GA1474@flamenco>
Cc: qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Claudio Fontana <claudio.fontana@huawei.com>,
 Andrzej Zaborowski <balrogg@gmail.com>, Aurelien Jarno
 <aurelien@aurel32.net>, Alexander Graf <agraf@suse.de>,
 Stefan Weil <sw@weilnetz.de>, qemu-arm@nongnu.org, alex.bennee@linaro.org,
 Pranith Kumar <bobby.prani+qemu@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <df0a4da6-4f3e-3b44-ebbc-988017e29246@redhat.com>
Date: Fri, 14 Apr 2017 13:17:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170413014646.GA1474@flamenco>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.74 on 10.5.11.28
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Fri, 14 Apr 2017 05:17:57 +0000 (UTC)
X-TUID: wE7Ghu0MsthJ


> Any other instructions I should look into? Perhaps lret/lret im?

Possibly (for completeness), but they are extremely rare in 32- and
64-bit code.

You also didn't cover any of syscall/sysret and sysenter/sysexit in your
patch, which would be on a relatively slow path but not _that_ slow.
But that probably should be a separate patch, moving the env->eip
assignment from seg_helper.c to translate.c and using the resulting TCGv
as the argument for jr.

Paolo

> Anyway, nbench does not improve much with the above. The reason seems to be
> that it's full of direct jumps (visible with -d in_asm). Also tried softmmu
> to see whether these jumps are in-page or not: peak improvement is ~8%, so
> I guess most of them are in-page. See http://imgur.com/EKRrYUz
> 
> I'm running new tests on a server with no other users and which has
> frequency scaling disabled. This should help get less noisy numbers,
> since I'm having trouble replicating my own results :> (I used my desktop
> machine until now). Will post these numbers tomorrow (running overnight
> SPECint both train and set sizes).
> 
> Thanks,
> 
> 		Emilio
> 
