Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp480083wru;
        Wed, 25 Jul 2018 02:18:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcUCc8ffLs01lHzF5uW/mtTmKU4CySN96Mo0BEj6cR91/xl9IMrp9G33dv3CrSVI630w4Iw
X-Received: by 2002:ac8:13c3:: with SMTP id i3-v6mr19808279qtj.54.1532510326978;
        Wed, 25 Jul 2018 02:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532510326; cv=none;
        d=google.com; s=arc-20160816;
        b=hpQCwFSr4TxghIWsxDZXoNArRCqVrdXmXJuI+DeDdKlNwSHt4BC49nRFVQyaZuL+0d
         0npToom5Bthj32WoZLKm8a78heO3+qBjQoSfgd0rDEQfVex9w+qqoLan5WEpjZv7/gRM
         IfTT6WLMdhdHR+8jrPHM0IkLUE4UsgBAXgDsPg6OnxeRXbjr05qkqe04+lQOkOL7Y090
         /ZJZjjmTg7e+BJltHY6xxhsakWxgNjeBUmjlOEWkpdinGcfj/pdIntbLQC0ZuW/Q597A
         LclaqnTUEsQonogi2/fv/hl0BRWN5dqIitI0Bfijit9TKqPKcyAj1dDRny/VPbW2kv/4
         xZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:arc-authentication-results;
        bh=3wO3fTDk4fPdBR6p3IDaOgNdpBcdWLqi7oUOO91NQkY=;
        b=V37+ZUSucQ7u4NfLlbC8c71E7K2q22kiB8OSctHGZmPvW8u2/ErqqJCfThRHBYxpGE
         4CIN8p7t9g7CfhJxT4Jp9DDzyCmOLyH9W0NvCBGef38hHKbrBBvSyY+tbgq9782kItWS
         WtduF1T9cX6OqEqfLumOhmdDVUefYcdy/DHa5lMJwPCW8Gk6TSytaMSm0qldWRKyu9n9
         DPaNLDz6K/QaeUTSxvQx9vf5osJCFuRw9XnQKyy+w0bZnXZ2S/n1W/JhoBxbmVN2mdZJ
         39LdBypY12B6LfIsnoyIi+wKut1dQaSdUDp+s+WInzXizhiXNpZLsWOA40rcr5ZKP1qR
         RgUw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id w63-v6si188569qkd.71.2018.07.25.02.18.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 02:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7121A401DEA9;
	Wed, 25 Jul 2018 09:18:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.89])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 130192166BA3;
	Wed, 25 Jul 2018 09:18:41 +0000 (UTC)
Date: Wed, 25 Jul 2018 10:18:37 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725091837.GB12855@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725084824.GA12855@redhat.com>
 <CAHmQWvDtNQsPDy1tCnsy9JbGzMxLAik5S0bBfpCj_0ig8=iZdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmQWvDtNQsPDy1tCnsy9JbGzMxLAik5S0bBfpCj_0ig8=iZdA@mail.gmail.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 25 Jul 2018 09:18:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Wed, 25 Jul 2018 09:18:46 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-TUID: lsX7WBs656j6

On Wed, Jul 25, 2018 at 05:05:06PM +0800, Hongbo Zhang wrote:
> On 25 July 2018 at 16:48, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
> >> For the Aarch64, there is one machine 'virt', it is primarily meant to
> >> run on KVM and execute virtualization workloads, but we need an
> >> environment as faithful as possible to physical hardware, for supporting
> >> firmware and OS development for pysical Aarch64 machines.
> >>
> >> This patch introduces new machine type 'Enterprise' with main features:
> >
> > The 'enterprise' name is really awful - this is essentially a marketing
> > term completely devoid of any useful meaning.
> >
> > You had previously called this "sbsa" which IIUC was related to a real
> > world hardware specification that it was based on. IOW, I think this old
> > name was preferrable to calling it "enterprise".
> >
> Thanks for your comments.
> Frankly, I myself prefer to 'sbsa' too, in fact, at the early stage of
> developing, we called this 'enterprise', but later I changed it to
> 'sbsa' until I sent out v1 patch.
> 
> The work Arm TF and EDK2 porting to this platform needs this name to
> be defined finally.

Why should EDK2 care what the QEMU machine type name is. The machine type
name is purely a QEMU internal tag and shouldn't be visible in the guest
ABI at all IIUC.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
