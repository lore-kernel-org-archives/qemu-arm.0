Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp798759lfm;
        Tue, 7 Jul 2020 03:17:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyg9f7YLBj9L8gEyMPmbB/1UDZEcJcCMubgLEzbHGudErDW6LXoqiSJHzFas17uRpbpZBam
X-Received: by 2002:a25:ae8c:: with SMTP id b12mr20813729ybj.276.1594117022153;
        Tue, 07 Jul 2020 03:17:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594117022; cv=none;
        d=google.com; s=arc-20160816;
        b=gxozbAVY8/pvUN+x6w1fp6XrXTwWULqAedVia4UeGBEKIElYVffa8GNki5Jv41ow1n
         mCuDtQ7Gt7NsnUO1VssdOn0heoNVdcF4xTls+/xbPr45c+8RnROR8Zi/dNdt71SEzKDr
         OstgE6yPnc5vH5+CBLGXsGncVDlb/QCIJYkYSYtIGmHVW7FMhraqpjvVW93lao3CJBSX
         mINifZ0YeCYX8/X5YZgb4aF+m7TnlbYdzc3V/SlP5AD4jANp060Rur8d/mwvmHOjnZCE
         iP0djhJArR/4zB4oN8vD29t1qP75Anx8UOyVo3SbJ15whcGyRwVWkKjCku3uoVsR9XWe
         5NFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rWGy1f3j7GSA4d5bloldhJkc4uC7/+lOqpPDq31wOMw=;
        b=r9S25cmpgbSrnxCQGVhoBH/payfKKchNaHkaDe0SsDEvJcOwtLmd/ekMra3Mq1DCaY
         o58JlT+Tk8xQd0EwrrjUWaRCpaCfGybdbvd7mc34Z/YUZI4UrfGnqO3SFAPux97JOavU
         bsgcvXxz0bKzavif4xDvFh9uyqKhmSKXIF06cJbu3ye6v1z/f4FmxDJ4Z55F4JK6Uly3
         TplSEjEtTm8Cf2agrTfTrVwpXYW5bl23nrTnAdQuVhxXO9dnpXjIINow0b9hFEXCXvRR
         wNGVHVIDBqMSc3QjyVQz6db41+woM9zjn7l8pEhFovyi/VjJPVAkf0KV59w6Cm0Wm+Rk
         LDbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ldllTXLZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x80si22141061ybg.445.2020.07.07.03.17.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 03:17:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ldllTXLZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jsker-0002Bo-JR
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 06:17:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jskdd-00017L-MB
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 06:15:45 -0400
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d]:47011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jskdb-0001zx-41
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 06:15:45 -0400
Received: by mail-ot1-x32d.google.com with SMTP id n24so31694522otr.13
 for <qemu-arm@nongnu.org>; Tue, 07 Jul 2020 03:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rWGy1f3j7GSA4d5bloldhJkc4uC7/+lOqpPDq31wOMw=;
 b=ldllTXLZCO1DgbzE+lsLSyU5hwIUpsP78bZ4t+ico7RWI7tyTX0oaaHp4asBHTfRWu
 Y4inGfc8F1jnegZYj1vk63GGQDelHWeLLQX4QZTSQ/NSQ19o9daNxkSftPtmG3+hqQrz
 ZN8kbhhq/dnRAMPb/pHcalK+sKcQLi3R1LOBOMJIHkqHF5kz77TtoA1yVLPlf6i9THE5
 W6n67RYqAuaF18eQglt2Pmr9CxXaQRaR60bc3+SXA5rLD6NoC9XMLdOsWEj0LMWiHDsl
 pWYD1CC1FqRX8I5LbCdxupOFvIeaG8CQNfI/gGi99hRpplSK0YLGFANLDqCHLPe2xayK
 SBzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rWGy1f3j7GSA4d5bloldhJkc4uC7/+lOqpPDq31wOMw=;
 b=Clk7Q3SFa4hWxLc0cLbUoSOxsb1z4PkrWIa+nzU4UyijBKkGsw4Z6jnmYhTxeCECzE
 mK7fgTkmmKoUuGlIREWoQwqC+az9ywisvS//9kIU/wrh/JxLFZDYlu8Y+mTuT/6U7/Vk
 ToxongX6vw654e8TeuFo65Lwkg/qgMhieSvQICwD0DM0vij06yF3/Eh43mNGi1EjaCZe
 gzS32wJTi8+sk3QxM114wmZGOmdqcKNIq/vxvmVwaDVdLTUUc8fPU6H1X7yEZpocNyKK
 n1gKPOSQAjYluCB7El+zQ7kwg6lD84QEouIu0fJcKyGG5mkIl69lAPxeyMhpzWJg3WY+
 z7xg==
X-Gm-Message-State: AOAM53296xMAlNrnm+V0c95fsu0SeRwCsUk4fW5oZlrQ20Usz3TtuEVX
 K1S2ZTGuBcGszJPcQju838I1jrQ0/95XOpZMLF9kKQ==
X-Received: by 2002:a9d:7303:: with SMTP id e3mr37763180otk.221.1594116941367; 
 Tue, 07 Jul 2020 03:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <1593769409-13534-1-git-send-email-guoheyi@linux.alibaba.com>
 <CAFEAcA8RU6fS8PX7LMhn4U33nKoRvcO_mnyBFcmW3iOpA40sCQ@mail.gmail.com>
 <00016872-f1ca-5989-8ad6-28cf05ea0c57@linux.alibaba.com>
 <CAFEAcA-eyudHSQhEaM-G5hpVOqEG4G_kZpT=vjraciux-7P7Bw@mail.gmail.com>
 <20200707100436.72ldilqrnwc7pg55@kamzik.brq.redhat.com>
In-Reply-To: <20200707100436.72ldilqrnwc7pg55@kamzik.brq.redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jul 2020 11:15:30 +0100
Message-ID: <CAFEAcA-h1wXyeqymz3jYiVA_fmADe=C8eAewxUXtLL6ERbqJgw@mail.gmail.com>
Subject: Re: [RFC] virt/acpi: set PSCI flag even when psci_conduit is disabled
To: Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x32d.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: yitian.ly@alibaba-inc.com, "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Heyi Guo <guoheyi@linux.alibaba.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J65jSXANzg8C

On Tue, 7 Jul 2020 at 11:04, Andrew Jones <drjones@redhat.com> wrote:
> This seems a bit messy to me. With an EL3 firmware, the DTB is provided
> by the EL3 firmware. I guess that's why when I look at the DTB generation
> in virt.c we don't properly set "enable-method" of the CPUs to
> "spin-table", even though we don't set it to "psci"[*].

Well, there's no way in the DTB to say "all the CPUs start at once" :-)
"spin-table" would be just as wrong as "psci" for us in that case.

> So, I think the EL3 firmware should also provide the ACPI tables.

Mmm, but I thought the general design for QEMU was that we have
to help the EL3 firmware along by providing ACPI fragments for it
to assemble. As I understand it, this is a pragmatic decision
because the binary format of a complete ACPI table is painful
to edit. So I suppose one question here is "if QEMU doesn't set
the PSCI flag in the ACPI tables, how hard is it for the EL3
firmware to edit the table to add the flag?".

> However, this patch it probably fine too. For a configuration where
> the EL3 firmware provides the ACPI tables, it will do no harm. For
> configurations where EL3 firmware isn't involved, it will do no harm.
> And, for configurations like this, which I consider a bit hacky, it's
> probably better to assume PSCI than not.

Is this really a 'hacky' configuration? I sort of expected it to
be a fairly common one for the 'virt' board. (For sbsa-ref the
EL3 firmware would provide a complete canned ACPI table, I think,
but for virt it can't and shouldn't do that.)

thanks
-- PMM
