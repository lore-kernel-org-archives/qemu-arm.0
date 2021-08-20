Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp1355581lfg;
        Fri, 20 Aug 2021 07:24:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwx8d/DHOQ+PoYZuP42dReHin0wOFq3+OK5kfCDem/1DSk7homA27FufJ1UHmaAE8iA9YXv
X-Received: by 2002:a7b:cd1a:: with SMTP id f26mr4242093wmj.136.1629469465419;
        Fri, 20 Aug 2021 07:24:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629469465; cv=none;
        d=google.com; s=arc-20160816;
        b=uyNV+KYU9rDZdrDWoQwwIGM06bUCyv6OvsebWKKdaAD19dATYriQxgzy2ZzAnU913B
         KkkLv1gv2e/nLNyuoA6/LnIFM4YBWIFmMKpj56Gb9w9EOhEpK1SPceqgyoCmwQPtil9k
         SYgCjmO+iLdr3OFRnBmbSTf3OyWPwLALEDWNlPU5hi7GBZFFaWjqB6eYjRfB3tl35f03
         TIiQwCvMg4odbmOJ1MVJ4tGIUsFUrAGymqPbT1goO7RjUsuqLuLEYDk+iEfQNe/Lu+EJ
         E5HLZfaQz/BPzksnm5VJWQ8LYlIZy9otxf14KNMVuZPAryCPS3310BYH8oLPxGcgAX0R
         0uhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=gWaaO7WqUakCyfTSQlSAKmL4DO2s7/pZ0OAOPrtmBgw=;
        b=Dz1Ev9CbYgNCwimhooIGjTGjuRXiUSsnJTqCu0vPaxShc4RH0j+8EIAx+E4CPZb32X
         +WNh6r4a/See7glNNCWE7aZXbODLqx6u/UVca/xbuxZA4rkpvwXk2bXO0v7ThuMvorG+
         ogp9ZZo/jAuDZ9I+/o1Aq+cfwgnWcfyOOYjmzljynWGPepA6oOp0YqM8/BqouYedrGy0
         A4qRwAMcaBKSJAplwyVbIXPgn1tyYJkYF+17+/Km7hSaJeVdDtfF/mib6LmBFRzFZQWe
         TltPaNADKj8frCewZ4UhpExjAkOYvZvI5G7tUQAwn4cxMJZ1RSqKWx+fhCHdRYj4zfj3
         PeLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SR4Hv1F8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g82si7796858wma.124.2021.08.20.07.24.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 20 Aug 2021 07:24:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=SR4Hv1F8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mH5RY-00031i-Cv
	for alex.bennee@linaro.org; Fri, 20 Aug 2021 10:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mH5Pd-0000Ls-HL; Fri, 20 Aug 2021 10:22:26 -0400
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e]:38691)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1mH5Pb-0006Hz-KC; Fri, 20 Aug 2021 10:22:25 -0400
Received: by mail-yb1-xb2e.google.com with SMTP id a9so15677826ybr.5;
 Fri, 20 Aug 2021 07:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gWaaO7WqUakCyfTSQlSAKmL4DO2s7/pZ0OAOPrtmBgw=;
 b=SR4Hv1F8oIPZReJjXCSZIWY2UMX+DYUJC0x8D46/pm3TY6IQ84Kcd8ujK1zRPLGzLY
 SU0bjmgRypZVmTvC4+97kFrxDx3Ksn6ydUKkc5jyqA7dvUN6+7ZPMzGNlrkz3TLcqjWS
 uDOEEQw+2FvEkfxTotKyi+stbTbhfIMVcgDGwLg3QJczw8vAY8SuySdhDy3kPOluWuUM
 vzn5gBDllvDvhkLqxr8XVvEJNtP+arKnFH4wMA9JQev2gA3N1m9RK2u56GmmRbzQy/Pc
 AfYS9nSr0wQXJfxIHHX6oWVDSNC101HRYW5OTdijKsasv6y6ICP97wiBmx1A8vg2Ykzm
 t+FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gWaaO7WqUakCyfTSQlSAKmL4DO2s7/pZ0OAOPrtmBgw=;
 b=hWKa72CzGOuxh9wTmn/cxMP1ZSDaW9Z3JEQsC5X/Uee+WvnEfBXgRDpXFft7luO7LN
 5tQz/CIPnHDKLtiO0p9HKKoWUIxc5gZTduRISuoO7OCj3MHDF7pVL0m+2yLMDNJJLaCm
 gPRmBNfsuwn8KsWKGCloj43niyhrwS5T7IOTyj6fCMwcRvv5+PphVklXPa7UW3L1I3YA
 UqpioHZ0Tt30daRt9sClvoYfiPkyoao19QwXvPqTaqg4obBKH1Hm3ZAp9JgiS/x/01bl
 Zr+33wfuPnHWpqK+I953lLAsQDPCWbwCv1qAEkg75l40vUSBRS9J1sTJpmlcg8RnHEgo
 ZHyA==
X-Gm-Message-State: AOAM531yct7wowXVqYNvZx8ewVrcDirema/FO7uimfs5YEuks6FpDVkb
 EprKXaa8va9PY6YjReV1MxHoVxfqvOg19L0f1Ds=
X-Received: by 2002:a5b:304:: with SMTP id j4mr25233107ybp.314.1629469342102; 
 Fri, 20 Aug 2021 07:22:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAEUhbmUhKFFxSspve+t2BeppCGPegpb_Z5g-w8M5t-JMLy3Zsg@mail.gmail.com>
 <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
In-Reply-To: <869f8be9-b76f-e315-9591-9c452bedf922@redhat.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Fri, 20 Aug 2021 22:22:11 +0800
Message-ID: <CAEUhbmUE4fb2NewE+Cze3Le5xOeH53NDbwdnKH==dnZeKGPQeQ@mail.gmail.com>
Subject: Re: xilinx-zynq-a9: cannot set up guest memory 'zynq.ext_ram'
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>, "Richard W.M. Jones" <rjones@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: g3oX9yX+hsvf

Hi Philippe,

On Fri, Aug 20, 2021 at 10:10 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Hi Bin,
>
> On 8/20/21 4:04 PM, Bin Meng wrote:
> > Hi,
> >
> > The following command used to work on QEMU 4.2.0, but is now broken
> > with QEMU head.
> >
> > $ qemu-system-arm -M xilinx-zynq-a9 -display none -m 40000000
> > -nographic -serial /dev/null -serial mon:stdio -monitor null -device
> > loader,file=3Du-boot-dtb.bin,addr=3D0x4000000,cpu-num=3D0
> > qemu-system-arm: cannot set up guest memory 'zynq.ext_ram': Cannot
> > allocate memory
> >
> > Any ideas?
>
> Richard hit that recently too.

I hit this when in the VM on Azure pipelines, but I was able to
reproduce this issue on my local machine.

>
> Can you provide:
>
> cat /proc/sys/vm/overcommit_kbytes
> cat /proc/sys/vm/overcommit_memory
> cat /proc/sys/vm/overcommit_ratio

$ cat /proc/sys/vm/overcommit_kbytes
0
$ cat /proc/sys/vm/overcommit_memory
0
$ cat /proc/sys/vm/overcommit_ratio
50

>
> and
>
> cat /proc/meminfo
>
> (CommitLimit, Committed_AS)

$ cat /proc/meminfo

CommitLimit:    12388820 kB
Committed_AS:    5019088 kB

> and OOM messages.

I did not see any OOM messages.

>
> Per David, 'you can trick QEMU in trying to work around
> that issue, specifying a memory-backend-ram with "reserve=3Doff"
> as guest RAM.'

Regards,
Bin
