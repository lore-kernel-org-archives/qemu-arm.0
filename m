Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4626790lfb;
        Tue, 27 Apr 2021 02:55:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxxfysHoKI+fYv2r5fDYP3zdznR2UtOljgQHFCHDNmb69lngneT3Qz/o9OSFQvNvytkTI/H
X-Received: by 2002:a6b:e903:: with SMTP id u3mr18540766iof.161.1619517336370;
        Tue, 27 Apr 2021 02:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619517336; cv=none;
        d=google.com; s=arc-20160816;
        b=egsUhQeI60+82HfGmrMH5a0gEs6fuubdRm278znkFABk+8zH22yoXk7iGJVYw2K0IJ
         gKXu3WeyK+eW0H3V//ymuzKbfD0amQxj1R4YWbkdJ+1cFD7m1qQAvBtXnGi6jeIecPn8
         7YGp/Rw9ZP+OZC4Nibd/063GbdgVaFMyVe2uQvx616cfVjAMyKHQX2ZwjHlirbmVWwO1
         OEY6p2oG/3Q7wcTZTGTpWq8G+T08K5z+7Ye8aCRrI7m3KCYB/WcAqRrL+9KMiRC3VYqJ
         GktjcOZkK17hj2l7IUkc/3/K8PwAjYEmB1zG4LE2K4I51tAv2eu3nMT8s0ioMNgS2zO4
         ax2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=9wLZIdtJh0JSaP+OKGTPxmslcacRHG1/lfRLscjC014=;
        b=Dc6DdB9/X3rJCA4BWJGVU5E4J2AYxjkioxKPlZIvoqV5GxvV4u4aCSO5m+2sXK6p4J
         jvoWJoEvI3aewrvQSEZj4/r/K5YOPOzqD3Xan9KXCVY4uKJi/RObaf1pYkF8cD1b4BeT
         vtM1eW328kZDTvO9lR1KDXd+0TfhqxicYQB8Nu7npjefxxrzAoL18jlfIFkNpNLLjOrU
         d/RSiHb12VFCF5f2N936RWrse7YKob6wamVzrowyR0HXidYJNXUncHNaMifE8nHUsip5
         WCQ/xjitVBzC0KwfQUNyFl7fwOBTsaJumxRlSwOfSSHQv0We6wTQ6Qi+KYsAhcQYycwr
         /kSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X0mEIZJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j2si17431696ioj.71.2021.04.27.02.55.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 02:55:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=X0mEIZJU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbKRL-0004Ck-PM
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 05:55:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKQx-00041N-8s
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 05:55:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1lbKQq-0001uD-8N
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 05:55:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619517303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9wLZIdtJh0JSaP+OKGTPxmslcacRHG1/lfRLscjC014=;
 b=X0mEIZJUmAFCti1YkRuxGIZwMW8FZ4r5oZjtK6ythXLWfh7tjb9vW55Q1yEfY5kD+0vz0i
 gGkyhr3xv81lFxp0YBDrZRU6zyNCV7NWE9KGkCnxDFQ5RId5u3jni7FjJHTmCLTPdA93vo
 9Qo/bO8zFJfKrhmEaiZH0zwkL2AxfC4=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-Oc1UB-bgM-q0CirMWtxVbw-1; Tue, 27 Apr 2021 05:55:02 -0400
X-MC-Unique: Oc1UB-bgM-q0CirMWtxVbw-1
Received: by mail-ej1-f69.google.com with SMTP id
 ji8-20020a1709079808b029037c921a9ea0so11043486ejc.9
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 02:55:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9wLZIdtJh0JSaP+OKGTPxmslcacRHG1/lfRLscjC014=;
 b=RWPvnZ1wMwngdoPQJA2Wwh9WyvFCCRqtyBll+UjQ2PHw4JcKRem0RPBkHwYWAyzdnU
 wV0aAJiq1UHpCwd7xZdlL8bJoo+JRyabOSiWqBmm63UMkgY1erXFRKOg/wQu0u7I1Nl1
 Jv3rqPnlEn4X+TRukg9c24c+zauSvpMsx1y0+tAOegO0UmFi8b7QOXV7xssf02S7uIaP
 nzLQ2d3RngmfETC6lgW6gPDDLoLB8CpwSmK8z/kmSUOTIry6v84WBIUKy/rbXFc1pwri
 hTN4eLnlXp9A9J1yqvWZP5Sf33f0Sid5m9D93TmMK9RHSUCuyxxVQKzLU5U13CYr67lw
 Yenw==
X-Gm-Message-State: AOAM532n5su4Aoj0Ggdw1KpDu7QXy+pjVgsrQ1qCIubA3b4xeGMtToBa
 iwNik9pVV/00CGpuWn0e5ib08TW64a0OYpXWj0Qus93e68yvB9XCyPzim/Ns3flfJLJfJEoz12+
 NV/x3bhPUDHef
X-Received: by 2002:a17:906:4d42:: with SMTP id
 b2mr23077459ejv.270.1619517300989; 
 Tue, 27 Apr 2021 02:55:00 -0700 (PDT)
X-Received: by 2002:a17:906:4d42:: with SMTP id
 b2mr23077444ejv.270.1619517300774; 
 Tue, 27 Apr 2021 02:55:00 -0700 (PDT)
Received: from gator.home (cst2-174-132.cust.vodafone.cz. [31.30.174.132])
 by smtp.gmail.com with ESMTPSA id gw19sm3925534ejb.56.2021.04.27.02.55.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 02:55:00 -0700 (PDT)
Date: Tue, 27 Apr 2021 11:54:58 +0200
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH RESEND v2 0/6] target/arm: Add nested virtualization
 support
Message-ID: <20210427095458.3hbckyqbmfztcmge@gator.home>
References: <cover.1617281290.git.haibo.xu@linaro.org>
 <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8a53rCGBGVr_mb0fVJPXFaCShGTJE0bh=L5Nvw6ATz6A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrea Bolognani <abologna@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Haibo Xu <haibo.xu@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DpV1ZoOAz9FP

On Tue, Apr 27, 2021 at 10:42:18AM +0100, Peter Maydell wrote:
> On Thu, 1 Apr 2021 at 13:55, Haibo Xu <haibo.xu@linaro.org> wrote:
> > This series add support for ARMv8.3/8.4 nested virtualization support
> > in KVM mode. It's based on Marc Zyngier's kernel KVM patches[1], and
> > has been tested on a FVP model to run a L2 guest with Qemu. Now the
> > feature can be enabled by "-M virt,accel=kvm -cpu host,el2=on" when
> > starting a VM.
> 
> Why are we making the UI for "enable EL2 guest with KVM" different
> from that for "enable EL2 guest with TCG" ? Currently an EL2
> TCG guest is set up with "-M virt,virtualization=on", which then
> does everything it needs to enable virtualization on all the
> components on the board including the CPU.
> 
> Unless there's a strong technical reason why KVM EL2 has to
> be different, I think we should use the same switch.

I agree we should use the same switch, but I think I'd prefer it be the
CPU switch instead of the machine switch, as it's a CPU feature. There are
some board properties too, like the maintenance interrupt, but we tend to
call a feature a CPU feature when it shows up in the CPU manual, e.g. the
PMU is also a CPU feature, even though it has a PPI.

Thanks,
drew

