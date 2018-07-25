Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp670542wru;
        Wed, 25 Jul 2018 05:59:48 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc7/oOxfKL367lV5nxIS8E8J2zkGHeBzI60K7tUUJqEBdrl+iK/V/GprADf8Kjqn0G497HP
X-Received: by 2002:a37:d197:: with SMTP id o23-v6mr19539134qkl.210.1532523588781;
        Wed, 25 Jul 2018 05:59:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532523588; cv=none;
        d=google.com; s=arc-20160816;
        b=OuHcUbbArxYe0LnWTo3n1/DMT89iVlOY2XTi+DLl8J8vH1gfqxZD/DxiF5oo2ayfBe
         EuFycu16b/quXidq59Ov25uGe+fCTAZLaWompg3pxmA24c000o0f96I2PMcz8sv+0cvi
         zlX70wICqt2d+Y+tAIoekeemS8l/QZtstFMO+BGo3OPxJ4wEol9virESpOaPCt2ACZlK
         tpUbH4Of6WB0YXDuCS/Q8JzKGnZqx1sVTfNTyXRdwMloToqZWdotCH53J6XDN2AASUFg
         cp7y/NoHTccMwYCi/Q7ov8uf8cLXTukZshRLMnRs+7rcTvi2ZVxMOlN4DkH7lon6AStL
         JwMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=yJwQiAsgkONUzrQ5SKTCUX/k1uSnP9K5eYF2wbNy8iM=;
        b=BDtncKHGb41cc1+aN4/UX+8r4RQ+V1c0zLnGlulMQ2brjxrVG3KtmtY6OcQVYUkC78
         zhwKle52bHqbJ9POLRhKnqjZFdD00E/+b5O6oL8SoD4DwV6nqyhEuYVT1/YMl6Y/zL6W
         lGspIw4CtAm9N2LAVXtpskPGXxIKoSGnzhrEmX94ZyOg/eF3dj8f8Jw1fz8FupKrZfUg
         D82EmltcLMJwEIjYJsnuJ2GC2B1ecuGkadmZD0a3PLqxMRV/6yKnhqIi3M7mzwzsG94m
         YM+2BWECK/vXQ7FkTeiMQ6NRbeZTh1/OahlaFu1N/0W79G2Ex7Mjih6LHREe1MGcbeCo
         Fgpw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id i8-v6si2418229qkm.41.2018.07.25.05.59.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 25 Jul 2018 05:59:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3AB24401FF40;
	Wed, 25 Jul 2018 12:59:48 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C7F4E111DCEE;
	Wed, 25 Jul 2018 12:59:46 +0000 (UTC)
Date: Wed, 25 Jul 2018 14:59:44 +0200
From: Andrew Jones <drjones@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180725125944.5nd5ydm4x4e3vvjw@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
 <CAFEAcA8wi2QV9cVg_Hp=8MYw_zfxvVciR2CbRZiGJNiQNPdHqg@mail.gmail.com>
 <20180725124700.GF12855@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180725124700.GF12855@redhat.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Wed, 25 Jul 2018 12:59:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Wed, 25 Jul 2018 12:59:48 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: 6+lDs09ywyNQ

On Wed, Jul 25, 2018 at 01:47:00PM +0100, Daniel P. Berrangé wrote:
> Would iut make any sense to call the machine  "refplatform"  or "refboard"
> to indicate it is a generic reference platform, not specifically following
> any particular real impl, albeit influence by the sbsa spec.
>

That would indeed stop me from whining about a machine model with an
'sbsa' name not strictly implementing a minimal SBSA machine :-)

drew
