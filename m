Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F09C4452D
	for <qemu-arm@archiver.kernel.org>; Wed, 22 Jul 2026 08:27:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wmSIM-000494-Hp; Wed, 22 Jul 2026 04:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wmSIK-000456-T8
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 04:27:12 -0400
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wmSIJ-000695-3p
 for qemu-arm@nongnu.org; Wed, 22 Jul 2026 04:27:12 -0400
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-81e6f0b4610so123358667b3.2
 for <qemu-arm@nongnu.org>; Wed, 22 Jul 2026 01:27:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784708830; cv=none;
 d=google.com; s=arc-20260327;
 b=s32aER9kd4Rl94D5RKwKLp75Gzlze8Q+PXNUYaHRXs2Kzk5zMYaiJ6pMVIrrxk5C5i
 YPqk6Z2lNAUB/rHtA4tXO5oD45IVvHmSBo+LAy5jrg79kLQEYIOao+lbsxTXCRQjhJAn
 CJMSiM0jxUAN8ab5MBh99eqKsSkQp7JcfSHlzWWjkpLf/osnLL5xlaw3RmmxtaAiwq/B
 drSDMBiZi7kHfIzUWCBVhcg3/SOrSAl6AN1Gi8BYYSMurfSSNS2lOfWiPT0kqNW5jm3+
 gUpt0FtfyQxMzwXr74DMyRdzW7lGv2TydK7EeuJGoJSi7xD3NIIuGpK5txEMcVKxafpx
 yjlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=tM7fJAJed/jW69c9wYglwSGLmt5mew2td6nHsMchr5M=;
 fh=hG1C+w6ZkFt8yP5cr9Jrgd9wjJTTOGK1bBOIimb6JW0=;
 b=eaW4mvNUo0Z9CwDRjnB6cizzEdEQfvRAqJwWjXIlAwISLBeVNWLIvUCGn+iDdEFsHr
 04Lf64V0jokdiSTuMbwtuC27huEOWs99n76ccaQ47beyGCc3d3xTE0iVepKP/MdDKdCH
 JVDykItPMpmKxj8Fxb1c4NkIaQVLY8P9HAcTW6gyoe1d/zvVRQHCAiKViCXWWLuQm866
 +YDQjolomAagAlRtcmh6hzesKj6iAf9XUxJ8Fe5ClWKIwjAiUSat6oSWUSvLibcjG9Ep
 tOBSabblD7jR2NIt6DBEcpCzdf+qoJtKbAY3HmWEdVZP89jGbO4poD/6+EHobYdkvvRQ
 lNjw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1784708830; x=1785313630; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=tM7fJAJed/jW69c9wYglwSGLmt5mew2td6nHsMchr5M=;
 b=BaJJXP9X7V6yEM+65od9dcrShsf/z8Ju8dAooR+009nkAWGHnj/8prulmtxlQMdpjM
 pRR/lZu+7gWaIbGeNolb8+TCED778ydSqbA9KvpVP0kQDZRZrZT7hRuTVlUHYOb6xO3X
 HxWvhIDiuhH8akR5vEfXJL7xDr1cRpDnsNcTV0YEfcXNFkD5UyFSpL8alr1H1Id6PsUo
 snIELOmAjZ4RJ3yIcNegbF01IIyELJ8x9PHkz7dw7G51sJ92DyCdm0Y5dzBOjNiDz4av
 AvPNmdOg0D81dyugsIqrsU4YjmiKwXZSJIQkANZbRjKul+WLGXaF7v6VZ0I6SCTxT/zd
 HKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1784708830; x=1785313630;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=tM7fJAJed/jW69c9wYglwSGLmt5mew2td6nHsMchr5M=;
 b=Q6U5P0wLVKTjNtGYKRFXtPNyj5ZYQGnEp86FTcJQZ12ahFyJz40OIsvAQs0xKryM1r
 Jc53dzWimmmRbar9quAgX/kdsUx9v3t2JjYkup+krlyeyljyyJcO1akiI59g9SgSfVe2
 2b3DfUE+GvcHTOfUQH+D1S46VSPnr93M/vRgovhX6gPUPy59EQgCUuZ1/lLaQZFZRtb7
 cDVzsbv+BVVWIt/qNd4MsJGYLRERDqQwVsoge4UHhriVdX/O/Qw17RPkoTHJOid4LLAv
 m5s9rFCC54Umrwp95nm6C135ULJ1EMrD1VteJJBRIAwwMWAxp6ebraSx0EDt0cmbUR39
 ekxQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoHN6HvZzDm7W8OtksgfvREI1pD7sq1U7maRPSV4fKz62tY1WMl35XxcjcEOfQtC4hBO43UhvB9fg==@nongnu.org
X-Gm-Message-State: AOJu0YzenyMMOIHPp79UNxx/Gbzd6mBYSkzD/csS+wFyAQgzF5GtfjWZ
 ZpIpqOPTOzlxLDeeuxgCgowO0CR7m9u+3YVmTKrQzVMrpDUUJAXWIsJmeuRR7QJCC0PvLiwhy7k
 dF4RJRhke3RqgJTcLUfXifdU89FU3cno0LHHHb7XM8w==
X-Gm-Gg: AR+sD13lal+N4vapQC2Vs4f0C/9TszeSkqu1AjPCdoEXv84cUs8Np9CzqE+X7CYXHYo
 yVOaBU62nQwn9ICacDVPGkZnNphjX7+PkhI3ohz5Nvsookgdl431i1FQ1M76+/DJmrN1ju/mG2x
 iRzs4jYHpujiwrAGWso/cxywXWM9Na66AzPMZUvQ6SDggha8Ny5jKYUM8ik/S8OaXwXonlVhruq
 51DzGZUMHkNG4gVF/JqIGippeaBF+Tkjr3nSTWw7UAOjvSj1/3McnFMpalDlIJV8GYUwtvxCSLd
 xRKvLK2vSWQ8jJ4InrifRAW9QNZk72szvrkJFA/NQzho3w==
X-Received: by 2002:a05:690c:6988:b0:81e:2b86:d75f with SMTP id
 00721157ae682-81ef2704c4dmr65442217b3.68.1784708829654; Wed, 22 Jul 2026
 01:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260715131819.14827-1-dingtao0430@163.com>
 <20260715131819.14827-2-dingtao0430@163.com>
 <63046247-5e3a-4943-852a-985ffdc1f087@tls.msk.ru>
In-Reply-To: <63046247-5e3a-4943-852a-985ffdc1f087@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 22 Jul 2026 09:26:58 +0100
X-Gm-Features: AUfX_mzzNm8zY6cS5eh0E3xtWBb_G8hwMppOvWwKTLpkXUE-jQ3hxrRDjbQaUWA
Message-ID: <CAFEAcA-k5U_AnQXTOEeshYSpZcQyOMrFEJgnqOqpO4EMQBGNZg@mail.gmail.com>
Subject: Re: [PATCH 1/1] hw/char: imx_serial: add missing migration state
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: Tao Ding <dingtao0430@163.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, pbonzini@redhat.com, 
 QEMU Stable <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Tue, 21 Jul 2026 at 20:01, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 7/15/26 16:18, Tao Ding wrote:
> > Add ucr2 from imx_serial to vmstate, and increment the version_id.
> >
> > Migrating on sabrelite can reproduce this issue:
> > 1. Prepare the U-Boot required for sabrelite. (according to sabrelite.rst)
> > 2. Compile qemu
> >      $ mkdir build && cd build && ../configure --target-list="arm-softmmu" && make -j4
> > 3. Start sabrelite and prepare for migration
> >      $ ./build/qemu-system-arm -M sabrelite \
> >      -smp 1 -m 1G -display none -serial null -serial mon:stdio \
> >      -kernel ~/u-boot
> > 4. Enter qemu monitor after uboot. (ctrl + a + c)
> >      (qemu) stop
> >      (qemu) xp /4wx 0x021e8084
> >      021e8084: 0x00004027 0x00000784 0x00008000 0x00000a01
> >      (qemu) migrate -d file:vmstate
> >      (qemu) q
> >
> > Load the migrated vmstate, before repairing:
> >
> > $ ./build/qemu-system-arm -M sabrelite \
> >      -smp 1 -m 1G -display none -serial null -serial mon:stdio \
> >      -kernel ~/u-boot -incoming file:vmstate
> >
> > (ctrl + a + c)
> >      QEMU 11.0.50 monitor - type 'help' for more information
> >      (qemu) xp /4wx 0x021e8084
> >      021e8084: 0x00000004 0x00000784 0x00008000 0x00000a01
> >      (qemu) q
> >
> > It can be found that the data for address 0x021e8084 (register of usr2 in imx_serial of sabrelite)
> > is not the data before the migration.
> >
> > After being repaired:
> > $ ./build/qemu-system-arm -M sabrelite \
> >      -smp 1 -m 1G -display none -serial null -serial mon:stdio \
> >      -kernel ~/u-boot -incoming file:vmstate
> > (ctrl + a + c)
> >      QEMU 11.0.50 monitor - type 'help' for more information
> >      (qemu) xp /4wx 0x021e8084
> >      021e8084: 0x00004027 0x00000784 0x00008000 0x00000a01
> >
> > Signed-off-by: Tao Ding <dingtao0430@163.com>
>
>
> Somehow, this grow Cc: qemu-stable@ in the final version which was
> applied as v11.1.0-rc0-68-g8833ff95eaf.  I don't think this is a
> good candidate for the stable series, since this fix changes the
> migration stream format, which is very difficult to do in the stable
> series.

On the other hand it goes from "migration doesn't work" to
"migration works" for a typical guest :-)  But I agree it's
probably better to avoid migration breaks in stable branches
unless they're fixing something really critical.

-- PMM

