Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp2959184lfq;
        Mon, 21 Feb 2022 11:22:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw9ubuYTX+nBRxlJUzkcWAV0s8EqSteNqFoZFFKFPbZojgBV2i3QvSrknACrUk1dVdTxy3l
X-Received: by 2002:a05:6214:509a:b0:3ca:dec5:847f with SMTP id kk26-20020a056214509a00b003cadec5847fmr16726168qvb.112.1645471354669;
        Mon, 21 Feb 2022 11:22:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645471354; cv=none;
        d=google.com; s=arc-20160816;
        b=u35tQJRB3QhWg0vFuWycJKeDkmjTCz4tTjl6ApD9qaXcx3jnrTBR7cPMoah4c9wXrM
         MrE2XtZlgRWAhHllWM/pGlxtLzKFrDzOrBw0EFNtJ4PEKK2kP8wanxr7oLslTUrUKc5z
         sLeOqeNs92SMZgWlOZUtFNFus+uBbLArQVWlG8KWJ/03sG4zF2/IVsIrUf9RUcVhnaM9
         WSBmjp0L4Fe02OO4RB4Lgfa+EaJsfjGu7UMRKC7vnV5ATYNygHkupINHn5ey0yXe0hnr
         UpjlrFmYbv5Qb5Gct6G1K4YuWK/7bxBNI+JRuDaHkOwStLNoQzKPsVprDmbqzk5AXWjs
         zJNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=Q6GLpIPj+eVLViV+q/ZagCH+41+t4ZXoq4KtoJfYsvM=;
        b=kNylifUaNYLoyGYQiniJpe/220dbWTXbM+3FkI1+jpeelQKbO6FSYOjaSWeItDAsdm
         8mf7S9Fw8WblL8eW0tdloq4S7Qm6A+DraF+xqM6wD6WqWMJ4HqPu+K9emzMVst2QV2HY
         MY7cCp4gO0IqgttECzqWq17KUceh0pYnb2ZdhMdVA/coRP6tFBPsOoDANSj2ftCRmqSe
         zaxoPmtiPQ+IzGDcxglRaKg5y0d0SwVkxtORRjTPZQyvzZeUuXujWugLXy2lskhlBEDZ
         FliesIGrb4q+wpTHI8RijBnt5zCxjpAVLx0I4sDf/aaUZwUqnZDkPr4r8gAfP6gO1FNZ
         aN4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQUACE1B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si16520165qta.16.2022.02.21.11.22.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Feb 2022 11:22:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WQUACE1B;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nMEGX-0007fv-PG
	for alex.bennee@linaro.org; Mon, 21 Feb 2022 14:22:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEFm-0007dq-L7
 for qemu-arm@nongnu.org; Mon, 21 Feb 2022 14:21:46 -0500
Received: from [2a00:1450:4864:20::32e] (port=50846
 helo=mail-wm1-x32e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nMEFi-0002d2-47
 for qemu-arm@nongnu.org; Mon, 21 Feb 2022 14:21:46 -0500
Received: by mail-wm1-x32e.google.com with SMTP id k41so10099753wms.0
 for <qemu-arm@nongnu.org>; Mon, 21 Feb 2022 11:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q6GLpIPj+eVLViV+q/ZagCH+41+t4ZXoq4KtoJfYsvM=;
 b=WQUACE1BbIS5O+HbJV6386e7i3T/ECAXDt2I5BB3eRwXLS1yS9hDE3FuoqHB55Ms6h
 0Yy1UP3Xephx4zDsiDWXxTQOxnGZeBteGGOfoFqyeXd1x5qAUX89f6u/g6bZ+bg7SogC
 xJqJXirpRaYQ55SJvPtFU9dQz5kOMD2sejGsaBHsvcglUwwpHxKC9enkX/roWlrlVoYs
 MKF7ID7z5+WpYm/za2i3ViLoBg2bP6YEqBkdDUEZcF0esQUSgczdZmolv0gfl6fTnOqm
 jbfpmPvhibcnvBjd39oqBT6xXa7USspgDX8FIBpWoJ5pK+WhJmZa/Kd9tstA+epzdSjB
 Ueow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Q6GLpIPj+eVLViV+q/ZagCH+41+t4ZXoq4KtoJfYsvM=;
 b=hF/9KXyUZG8k5dLxC+Ny1Fffl8u+OWyhRxjIzpl/u1fjYI381NS57PuI8qr73xc6JW
 vXXoLI23RzoFMKNarLlq9A28MQfcvWLLr9W8QBSb5XgbB1f0StMvQXrmwKZv3eF9loeS
 KqohBENp0QCsb0L5nCEdN2sZ6b3w2YAWmAnU2pLrtqzTFadilMmB/3AE1Bkj/42AcJY2
 RUT3bDubp/Qb5+M/UTG91uJfVwJ+dUtyIU+6ORBwXcQpFm25R9XFVp4gMVzXkPEAJo5O
 Xq8lYgcIxdKIEmCWOl3E3+5N2u6dPWEjr9wNV/wJN+fyy+usRSUddPHoiShc75oFXU5z
 3LeA==
X-Gm-Message-State: AOAM5316zXFNOY3BOmO9q7Jb0Fw+j/X7ayRoj3VK0GxlE0TJ1Fr1xJjs
 NJe1/xxdS1ginaOtQNDuoC/qWrK7d4C/5A==
X-Received: by 2002:a1c:a1c2:0:b0:37b:aa06:9c51 with SMTP id
 k185-20020a1ca1c2000000b0037baa069c51mr409590wme.114.1645471285541; 
 Mon, 21 Feb 2022 11:21:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id j6sm38958226wrt.70.2022.02.21.11.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 11:21:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] qapi: Move RTC_CHANGE back out of target schema
Date: Mon, 21 Feb 2022 19:21:20 +0000
Message-Id: <20220221192123.749970-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +qsnbT1q2Ooq

This patchset moves RTC_CHANGE back to misc.json, effectively
reverting commit 183e4281a30962, which moved the RTC_CHANGE event to
the target schema.  That change was an attempt to make the event
target-specific to improve introspection, but the event isn't really
target-specific: it's machine or device specific.  Putting RTC_CHANGE
in the target schema with an ifdef list reduces maintainability (by
adding an if: list with a long list of targets that needs to be
manually updated as architectures are added or removed or as new
devices gain the RTC_CHANGE functionality) and increases compile time
(by preventing RTC devices which emit the event from being "compile
once" rather than "compile once per target", because
qapi-events-misc-target.h uses TARGET_* ifdefs, which are poisoned in
"compile once" files.)

Patch 2 fixes some minor documentation issues for the RTC_CHANGE
event, noticed during development of the patchset.

Patch 3 makes the pl031 a build-once file again, which was the
initial motivation for the series.

Changes v1->v2:
 * patch 1 needs to change the #include line for pl031.c, now that
   the change to make that device emit RTC_CHANGE has landed upstream
 * patch 2 now also notes in the RTC_CHANGE documentation that
   not all devices/systems will emit the event (suggested by Markus)
 * patch 3 is new

My default assumption is that this series will go in via the
qapi tree; let me know if you'd prefer me to take it via
target-arm instead.

thanks
-- PMM

Peter Maydell (3):
  qapi: Move RTC_CHANGE back out of target schema
  qapi: Document some missing details of RTC_CHANGE event
  hw/rtc: Compile pl031 once-only

 qapi/misc-target.json | 33 ---------------------------------
 qapi/misc.json        | 24 ++++++++++++++++++++++++
 hw/ppc/spapr_rtc.c    |  2 +-
 hw/rtc/mc146818rtc.c  |  2 +-
 hw/rtc/pl031.c        |  2 +-
 hw/rtc/meson.build    |  2 +-
 6 files changed, 28 insertions(+), 37 deletions(-)

-- 
2.25.1

