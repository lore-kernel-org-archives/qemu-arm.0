Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp331752wru;
        Thu, 26 Jul 2018 05:49:58 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe0DAjhpdA1l9v7oAErsB34RGfp6FWDJ5jhCn/qwVgMcky6L96mG5FZm2U5cvLz463qXD9N
X-Received: by 2002:a37:7a46:: with SMTP id v67-v6mr1479383qkc.188.1532609398434;
        Thu, 26 Jul 2018 05:49:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532609398; cv=none;
        d=google.com; s=arc-20160816;
        b=0jUK/GXOgWxX25H9xKGDyq5Nm14kfQJEkDAbF4TSsNYKa5vHO6gjWaLhFM/IHS2eaJ
         +0ivfk0G7qDxhgesNlqHnVY1V5464oTXh3Y9AxsVIChu9hiBOwRTmnD9tvZBPCOT7U6S
         WoeqQ15Wxw3i8dUHMgGbOWwYAd2ZeidP6xuXYgjDMA7h4txYPp6XdP5hi41xZ2/5aUN+
         TgV7nYUMYu3+IoOuLhchTZJEUAW1vfylnLSPfnJdKH1e69cPmVNQGKowkltpqeBmuVnh
         dJeuU84aQnbCFcH2tLUTmheLGuDMlY1mzLWq7Em9O1hJHxbIJDRB6ncA9gyVfHXZdSpW
         zjCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date
         :arc-authentication-results;
        bh=br6sIsEQIilaPidrLv9wBEa3ommGUt93HZe2amBjs5U=;
        b=li8rmUxcK0zKGxU6+On7s6F5ZEVWTycu8OQrTFrFEgW7MRnaVjGVzAbaYQW97lkuXr
         3rG6RDd6L5l0lGvwo/Y2stk2vLkdD5ZyQ6wUXnU1MOp7MJN1uCO2uXjssoq8g2lufZoK
         XmEf/0DdRwko2sKKjvvCHM/bLMNEgYGvovD/MvQGAHMc7Sgtzvx00hiK070w8Bkf0tEs
         91lGysaOH30zeVyJ84Qb70ebG5QDWsUSfIn4C5A/zlm+DejmIaqSAUoaBarf4KBNYT0d
         NCCqx7SDkjdvYaITW+ZDStjv9fQBKpKR17pBz1viNj2Bg94Sd/QMbyvAaKCleyNgswEH
         i7kA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id w1-v6si1071894qvh.192.2018.07.26.05.49.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Jul 2018 05:49:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB5487CBBA;
	Thu, 26 Jul 2018 12:49:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.66])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id ACB7B2026D68;
	Thu, 26 Jul 2018 12:49:55 +0000 (UTC)
Date: Thu, 26 Jul 2018 13:49:52 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Cc: Andrew Jones <drjones@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180726124952.GI22369@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
 <CAHmQWvC44mLchhEFPU0T0gKWVcjjozp95ZumaKK9EkPwpeehTA@mail.gmail.com>
 <20180726104636.aua3pjsqkqnkvggk@kamzik.brq.redhat.com>
 <CAFEAcA80549kHSO+8z334PYmoWshzz+EHJcPBxsmhBN_dk+0Rw@mail.gmail.com>
 <CAKv+Gu-m0=MmkaR0UGJ4mmYSNHmk9QQh06Wxx6k2wXWq+QF46w@mail.gmail.com>
 <20180726111354.flyqh2yo4xm5z6m7@kamzik.brq.redhat.com>
 <d0eb219e-b3cb-d006-1857-a399a65376f8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d0eb219e-b3cb-d006-1857-a399a65376f8@redhat.com>
User-Agent: Mutt/1.10.0 (2018-05-17)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Thu, 26 Jul 2018 12:49:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Thu, 26 Jul 2018 12:49:58 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'berrange@redhat.com' RCPT:''
X-TUID: CSaO3KGwFaF+

On Thu, Jul 26, 2018 at 02:23:46PM +0200, Laszlo Ersek wrote:
> On 07/26/18 13:13, Andrew Jones wrote:
> > On Thu, Jul 26, 2018 at 12:56:22PM +0200, Ard Biesheuvel wrote:
> >> On 26 July 2018 at 12:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>> On 26 July 2018 at 11:46, Andrew Jones <drjones@redhat.com> wrote:
> >>>> i440fx and q35 are specific machine types. 'sbsa' is a generic machine
> >>>> type that conforms to the SBSA specification. If you weren't trying to
> >>>> memory map AHCI and EHCI controllers, or if memory mapped AHCI and EHCI
> >>>> controllers were mandated in the SBSA spec, then there wouldn't be
> >>>> anything to discuss. But that's not the case. You're attempting to
> >>>> hard code one instance of a generic class of SBSA machines, but then
> >>>> just call it 'sbsa'.
> >>>
> >>> Modelling a 'generic SBSA machine' is not the goal here (I'm
> >>> not sure that's even possible or useful), so let's just
> >>> stipulate that we'll call the machine type something else
> >>> and move on ?
> >>>
> >>
> >> Fine with me. Care to suggest a name? :-)
> >>
> > 
> > Also fine by me, but I'm not going to suggest the name. I fear the
> > backlash I'd receive after this mail thread!
> > 
> 
> I suggest "showcase2018". (Dead serious.)

Further suggestions

   "refplatform"
   "sbsareference"
   "sbsademo"
   "phys"   (physical counterpart to "virt")


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
