Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp711932wru;
        Wed, 25 Jul 2018 06:38:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdM6sY5kqrJYdM/roc4QqZWbAUe0ztz2h/zr8wXiR4Z9bBX2i/IzmH0Qti9RwR2EU29wDFw
X-Received: by 2002:a37:5f87:: with SMTP id t129-v6mr20422589qkb.23.1532525895303;
        Wed, 25 Jul 2018 06:38:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532525895; cv=none;
        d=google.com; s=arc-20160816;
        b=OVLgaFWPXSxKGlpP/ZGAcOUNCz1XpHnsO5DnUZbUDhGy19KblwzCrPiIQb05394Xi8
         b8Mj4waSekcFaT8Nea17pNFaKOS5VBCo9U/MkogzsM1/+15ibRtJNSuVQFXDk6xMFkb9
         NEV9CkT3wqupCm8j+ndErqXKmrxsdIjopKBw2r5/5xZ6PCwroKg1TVqUGt1jnVqHgNH/
         ChVuTFXH2Dt3vpa2nUdgUEyMmxT06+Yf/ETE6UJZaM9GTM1ur9Y0am2wUm1sW5JPpfmT
         p7hrampsdglPfXFcckjilgKrsVUjuss1IZ0WxxXKrqvUXcxlTF9RsDcrjiy7tcmEZEh6
         FEWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=VY7874csZRBnZyflGdHnZDUGqxKg6owJQ8zRk7Skse0=;
        b=xeBNJs/2EnWgb/cEQEM8nswUdUCvXRcskXmMxoGaOBv8LO5Hj526/cGaPEPPggi4vF
         WKegLxwCBuQs8LDSpTM+4iUxOjuYevZ+rCl1Gr6/8MpbavemNpKyopORU+As/BUWBCMA
         kNtcv7srnjWF1gSs1tj3t6qj/FI66IemT19PyWBrsqWsb9wBDMWaMb99iS+TMg1lyDfE
         Lk6uskorrfVGM571yBLvDIeWtMlz34kLN801H7H0fnoE/IjYszLVOKN3OzR6mawkcsqk
         61yhn/UF50oJHPhqCsk3WIj59Ha/UddeVWZCqCau2X5dbhu3vCMMHpQh//w8SpxYN8uG
         bFHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id w31-v6si10532406qtg.3.2018.07.25.06.38.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 06:38:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B72B81663C5;
	Wed, 25 Jul 2018 13:38:14 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CD1C11018F;
	Wed, 25 Jul 2018 13:38:12 +0000 (UTC)
Date: Wed, 25 Jul 2018 15:38:10 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725133810.gsgfu4x6emygu5o5@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
 <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
 <20180725124700.GF12855@redhat.com>
 <20180725125944.5nd5ydm4x4e3vvjw@kamzik.brq.redhat.com>
 <CAKv+Gu-pbJj59wH7wgZ6Uq+Uko9wYEBqSF=WaC3LL68CFkbxEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKv+Gu-pbJj59wH7wgZ6Uq+Uko9wYEBqSF=WaC3LL68CFkbxEw@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Wed, 25 Jul 2018 13:38:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Wed, 25 Jul 2018 13:38:14 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: GvR1cGRjH529

On Wed, Jul 25, 2018 at 03:03:40PM +0200, Ard Biesheuvel wrote:
> On 25 July 2018 at 14:59, Andrew Jones <drjones@redhat.com> wrote:
> > On Wed, Jul 25, 2018 at 01:47:00PM +0100, Daniel P. Berrangé wrote:
> >> Would iut make any sense to call the machine  "refplatform"  or "refboard"
> >> to indicate it is a generic reference platform, not specifically following
> >> any particular real impl, albeit influence by the sbsa spec.
> >>
> >
> > That would indeed stop me from whining about a machine model with an
> > 'sbsa' name not strictly implementing a minimal SBSA machine :-)
> >
> 
> I still don't get why only a minimal machine is worth considering,
> given that a real-world minimal SBSA machine is not capable of doing
> anything useful.

One definition of an SBSA machine can be quite different than another.
If we only hard code the required [useless] base, but also provide a
readconfig for the rest, then we get a useful machine without loss of
flexibility.

That flexibility comes at the cost of platform-bus code (since we need
to add devices to the system bus) and a less concise command line. The
platform-bus code may indeed be too expensive for this purpose, but
we may need to see patches to be sure. I understand the desire to have
a shorter command line, but this is QEMU :)

Thanks,
drew
