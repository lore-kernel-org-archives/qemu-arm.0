Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp245810wru;
        Thu, 26 Jul 2018 04:13:58 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd4A64hkg2fk1oJLQphhBnNpdbsk/MihusYLnQB3kt0txyEXHuY+CBcd9WpkXUY0Axo2pBw
X-Received: by 2002:ac8:fb1:: with SMTP id b46-v6mr1251706qtk.31.1532603637944;
        Thu, 26 Jul 2018 04:13:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532603637; cv=none;
        d=google.com; s=arc-20160816;
        b=EjzWeU9ZiHKnLDUXCgZWjnXXRqUBkEFAcbLX1nJcrVzBeQYqDnddtQX+2vs0UPunK/
         jQtJYNhUkBzUqa72UL4iFS89Ped61AX8eB2juCnK0JX+g8PkG03SayFL59e2eyeyej0a
         j8lIvY1yje8+FP3NkZCe90b09gytu4jEgLOhfR7ssb8DD6zlOq6M8x3lpGFTCTsJVtHl
         8l6f0WsdDUlwq0PW0Of0hqlbbYn49i8Q1LrAVhvfbuooZXbP8gkixANETUoFy+LdNWGw
         J2ElUaIEEAQxPmMrSb0qePSAQ6w1pgUYx+wJB8PHJLEOoJgMS4c49LjW5fSD8RrXUuNP
         Foyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:arc-authentication-results;
        bh=+fsk5G7jERcO2JUL/8sBCtjZg+ipClORMCa0/rWpivA=;
        b=bMbUUyej32W6S7Aaf3vrcSG/ycmWIViv63B5F4/lQU12jwhPaCS8wv0JPHtR9pgGWH
         T0lW6t42I6MNQSK/jBJm1/Ab9KOLCRMRvVZFDm6hP12XRhQiZFB0DaAMU0mcFXxbJQsh
         0N4GIz5WHUVVfTNV5XiJ0Rj0/D5QNvLZLnmRiXuu6F7FRiy1G8a2uoyJJmlgan1iodCb
         l1/vLkoGmsGkH7YAQtT/tNLERJ5WHX5MlHLUdQYnqJct5/UItc3eCWicmuxXkRoW/tX3
         4lwHhtFsBiAZBeS/4ylg2bmfDxB+qZjVFWgFxQwqaH9BovrKX4AQShdPvlP1lt2GHA5n
         4UgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx3-rdu2.redhat.com. [66.187.233.73])
        by mx.google.com with ESMTPS id m7-v6si859220qvo.87.2018.07.26.04.13.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Jul 2018 04:13:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) client-ip=66.187.233.73;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 66.187.233.73 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 84BF24023337;
	Thu, 26 Jul 2018 11:13:57 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E6CB111AF3C;
	Thu, 26 Jul 2018 11:13:56 +0000 (UTC)
Date: Thu, 26 Jul 2018 13:13:54 +0200
From: Andrew Jones <drjones@redhat.com>
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Hongbo Zhang <hongbo.zhang@linaro.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine
 type
Message-ID: <20180726111354.flyqh2yo4xm5z6m7@kamzik.brq.redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <20180725095426.f7kv4ftngeje6pkx@kamzik.brq.redhat.com>
 <CAHmQWvDu+P26Y5CJfcQ=1_9C=hej_B8w7dLMbmuOmCV-+pYOJQ@mail.gmail.com>
 <20180725114404.6g335n3rfjt23hjc@kamzik.brq.redhat.com>
 <CAHmQWvC44mLchhEFPU0T0gKWVcjjozp95ZumaKK9EkPwpeehTA@mail.gmail.com>
 <20180726104636.aua3pjsqkqnkvggk@kamzik.brq.redhat.com>
 <CAFEAcA80549kHSO+8z334PYmoWshzz+EHJcPBxsmhBN_dk+0Rw@mail.gmail.com>
 <CAKv+Gu-m0=MmkaR0UGJ4mmYSNHmk9QQh06Wxx6k2wXWq+QF46w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKv+Gu-m0=MmkaR0UGJ4mmYSNHmk9QQh06Wxx6k2wXWq+QF46w@mail.gmail.com>
User-Agent: NeoMutt/20180622
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Thu, 26 Jul 2018 11:13:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]); Thu, 26 Jul 2018 11:13:57 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-TUID: LI1jk92o+/3K

On Thu, Jul 26, 2018 at 12:56:22PM +0200, Ard Biesheuvel wrote:
> On 26 July 2018 at 12:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> > On 26 July 2018 at 11:46, Andrew Jones <drjones@redhat.com> wrote:
> >> i440fx and q35 are specific machine types. 'sbsa' is a generic machine
> >> type that conforms to the SBSA specification. If you weren't trying to
> >> memory map AHCI and EHCI controllers, or if memory mapped AHCI and EHCI
> >> controllers were mandated in the SBSA spec, then there wouldn't be
> >> anything to discuss. But that's not the case. You're attempting to
> >> hard code one instance of a generic class of SBSA machines, but then
> >> just call it 'sbsa'.
> >
> > Modelling a 'generic SBSA machine' is not the goal here (I'm
> > not sure that's even possible or useful), so let's just
> > stipulate that we'll call the machine type something else
> > and move on ?
> >
> 
> Fine with me. Care to suggest a name? :-)
>

Also fine by me, but I'm not going to suggest the name. I fear the
backlash I'd receive after this mail thread!
