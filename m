Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp505128wrd;
        Fri, 31 Aug 2018 04:50:19 -0700 (PDT)
X-Received: by 2002:a25:4245:: with SMTP id p66-v6mr8324818yba.48.1535716219387;
        Fri, 31 Aug 2018 04:50:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535716219; cv=none;
        d=google.com; s=arc-20160816;
        b=EQlPZi3UKeakfR59sxLu1FSo4LbaFT4VHs23wxNnYt3NUQ+SNhKKj8bqYu3MJak6vS
         hn7mHF3JZHd4H6HI13QeYwrp4vWpZbqjw4d9qdWxsvwZG03uQjpF7cHunS5P40ydeJ0h
         Xnax4EteyqdyTtMpJHQJq2H3etZGZPFkMQaZti6sHOTMh3yQcJvUempUZUUdxch4ZZfM
         jKimzObldiiIK5nvc5NAANNB2alcSMrF4iZpm+x1DG4AkgJp9Wm78yyl1LpT+3swwENc
         v0o2WdSdImh2BQK94UWea4fghwr7j1otFJ+RLtjupjZTfLKYA6L7OBqnf6bjudLZBUyo
         AT9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature:arc-authentication-results;
        bh=qQzeYra+RXX1ooWeHUIylBLUWIRD70Sq5W+JN6AzgJI=;
        b=B6lFc6GJLCrGtey3BYvWBKymIZGqWe3WVTb6hrs1h3yipG76S6bGrGQAZfkP4zAbo6
         dG78JqoP28l2estqhY4ke2+GpKpkGQLXeOUPIeaeJ0yK+2ukt85hnkQ9/W4ZkvmNb7m+
         Mh+schmpOHvmxHnptWfVxntjuJRZzyL56hGRagOW1FbCoWc26H0NHoG/d7pItAc6LaUn
         D6Vnukg2CGYWmN7Cx/o8lawygQVywxTs5odpyBY7Tkurlx0azZVAwGubjKVCT4Kkhv2l
         XNfVAEIhGMn0APXUwfTKN3K6MZiUVaP97wuaTjhRyr8eaFhPeuD5B0OOsG0I8mhVajY0
         ueYg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CcPvakZL;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <hongbo.zhang@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 190-v6sor2079474ywh.115.2018.08.31.04.50.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 31 Aug 2018 04:50:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CcPvakZL;
       spf=pass (google.com: domain of hongbo.zhang@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=hongbo.zhang@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=qQzeYra+RXX1ooWeHUIylBLUWIRD70Sq5W+JN6AzgJI=;
        b=CcPvakZLgZ4SyCy+Iao7wQqn3sZyklFdWFIQyZ+ka//zt+UV89BM79+h/igBaTG2Wz
         91vyc4sysnwexWPyQOmms+vF9ZtzUU4yoipOMSM8WfAivODuQenbpn+CAqhjP2J3ZALl
         EaNPP1WmJMRMc8Jsyvs84LNh0fE1vszyzLTCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=qQzeYra+RXX1ooWeHUIylBLUWIRD70Sq5W+JN6AzgJI=;
        b=lDreiaJCwTLEv8ywz+9su0ipx/eLlp64Bh4Iw2ia1/jQwfAvY61wJakXryWWeLe7cf
         1J0prD/6rRGtDsfY+mIvJcwjC9Z0m8O5VPnl8EfcZknYNzPOHtsKPHjjDs2NwLwpjQXr
         SeG46B4TQHXFg8LR/7K4uVysAbM7p7Q0jZYeHRbgMWGb10yomAexdSCvTto5ZPST2NJN
         Rbqhn+jC3kRzZb1OYVfvFY2tL3pbgqbH+P361k/vSy70+mx07t1YzhDeW/apJHuuYfmX
         JMCiNn+E+7LZBNylk+ZIuUsfDXB8iDVI8GMvFFrfaNocD0KcazGwrzFoq9RznGMOsRNb
         c+Yw==
X-Gm-Message-State: APzg51BzRcR3NKrA8M08hLjenYkYQVE1DDXoE6S7CdFjFan9kVzgLlgi
	pTeApHBrEcJLx7Vp+sT3Q92xl6f07nETFXG9rh0c+jiX
X-Google-Smtp-Source: ANB0Vdbx2N26HbhxBJNnIpzi2dM/xpqS2SJsELsRxvz+KQ+WiUIa04AlHs4CPaB0YmThgNm2dkEg78teVAg34BY/VB8=
X-Received: by 2002:a81:9dc8:: with SMTP id u191-v6mr8713506ywg.274.1535716218998;
 Fri, 31 Aug 2018 04:50:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a25:9b82:0:0:0:0:0 with HTTP; Fri, 31 Aug 2018 04:50:18
 -0700 (PDT)
In-Reply-To: <20180831084238.4cn3s27vwauq5fjl@kamzik.brq.redhat.com>
References: <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org>
 <CAFEAcA9hivJzqksiSZbco4+EysYj=_y0t3k_L7TobxNPS8T2dQ@mail.gmail.com>
 <CAHmQWvC4Kp1CAeCe8ZTGtSeG7fnT=Xen4GFKfnhTBWUCJdQV+g@mail.gmail.com>
 <20180829134219.cmyqipnvukk6k2rp@kamzik.brq.redhat.com> <CAHmQWvA5t7zbbDDM0UvuKSL_Z8ey+x+vOGZumYjwsq0FC5AHGA@mail.gmail.com>
 <20180830083117.iekobw7l3arkt24m@bivouac.eciton.net> <CAFEAcA_s+9-4PYHyx_aAnxwt4e=VH77uBG7rC4JA++nOyjAaPw@mail.gmail.com>
 <20180830100233.nr6fm3npy57zl4xx@bivouac.eciton.net> <CAKv+Gu9r+1OBOSUBW_KpDEEoKyc=iwW4zVEe04-_JUnJtSGupQ@mail.gmail.com>
 <CAHmQWvAx8+_0vAOd_Pq0NVr5n0spYj8o5vsj1xjn+a1M81w=Lg@mail.gmail.com> <20180831084238.4cn3s27vwauq5fjl@kamzik.brq.redhat.com>
From: Hongbo Zhang <hongbo.zhang@linaro.org>
Date: Fri, 31 Aug 2018 19:50:18 +0800
Message-ID: <CAHmQWvDAYH+L0Hh+F=O-8SnU_9iYytu4VnoYKot5cwwhiDWBAA@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: Andrew Jones <drjones@redhat.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Leif Lindholm <leif.lindholm@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: V+2mWD92q/cR

On 31 August 2018 at 16:42, Andrew Jones <drjones@redhat.com> wrote:
> On Fri, Aug 31, 2018 at 03:20:45PM +0800, Hongbo Zhang wrote:
>> If no DT in SBSA machine, then the code had much more difference with
>> virt, so there is possibility to make it a simple separate file;
>> If keep same DT as virt, then there are more overlap with virt codes,
>> so I am not sure how the patch should like finally, I still prefer
>> separate file to keep virt untouched, but not sure if others would
>> suggest to extract common codes to a third file, it is up to the
>> maintainer and reviewers.
>>
>
> It sounds like you don't need many DT nodes, so a new file for
> sbsa-ref, where you build whatever you want it to look like and
> add the few DT nodes to inform firmware of a few parameters,
> should be completely independent of mach-virt. I.e. I don't think
> it even makes sense to refactor those few nodes in order to
> share a tiny bit of DT node generation code.
>
Yes, this is what I intended to do as I mentioned.

> Thanks,
> drew
