Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2787172ejt;
        Mon, 19 Jun 2023 05:42:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6JR2YhjnUGA9u2sffOphLy97nJz3NSfO/m7yiuCQQyziIV40JpCt+CUkfsp59Jayz7Iudn
X-Received: by 2002:a05:620a:191e:b0:75b:23a1:831f with SMTP id bj30-20020a05620a191e00b0075b23a1831fmr11359626qkb.26.1687178538525;
        Mon, 19 Jun 2023 05:42:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687178538; cv=none;
        d=google.com; s=arc-20160816;
        b=WzWrrwr9VNjfzJCWHEMvhRBS3QBSBPGNW2ENT694jgLC0h4IZwhE+boKrlWm0Gq/bz
         cm4ZJECzjQAZhFHON5jtDbXJ10XScfRdLG9DNEElh/mMWIi7pgbiHGAIJzCcTOZE9JhW
         9SnDq+mD29/3xkZiUX0BQnISUMYmwJkxPLE+fGSw49hspvfFTaJIHkbNxJyxF2Y9RHYh
         TcyR7v9hrYhxlomSvjxMvTo/+lpVj3vcWZtIITk9y7ThWGU09rdThZluaI/t88LXdvdl
         t7Ns4TmXP/oVZHq7FrQ8HHqWkJezkVE8LBPJGFV8m1trrUYErps7VcSGZmubL7xwsV19
         rJcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=TfKugS4KjnqpQKa/nYjplISxJ/N19TWhtnUZRtVhYPA=;
        b=rk2DBUU7VMLTkRgAA4Q+puRh2/VZOkXsX23ka0KD/7rypd7kiMzoNOqRHfc0qt2quf
         LYrmd9tlsbagujtJZcC46Z8ICU8QzvEwYa5emC4Rqpkde6PciqnV+GJjIehG3pHAmor7
         pkTr4jp7Ms1qv9cc3oCHZrSTTiYLZivW5Jrxud11CpSr5IdXsaI65HAZZol9n/ETkCtK
         vF48fz/7h3D4YVC32GOJsqQ9p8JRiNbVJy6nobD2juDNezUxUnzD4HNupvTwUo36/tof
         FhNug/gP4CzcEilMyd0an4zXpdyViulpVLPWpExN1IXilnA4XeH19VXgAPNYQ2c56o4Y
         DWOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hbs92V9M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i6-20020a05620a074600b0076200cd647csi5567501qki.198.2023.06.19.05.42.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 05:42:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Hbs92V9M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBECi-0000Jv-1I; Mon, 19 Jun 2023 08:41:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBECf-0000It-9J
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 08:41:53 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBECd-0002Tk-KB
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 08:41:52 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-51a426e4f4bso4013064a12.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 05:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687178510; x=1689770510;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=TfKugS4KjnqpQKa/nYjplISxJ/N19TWhtnUZRtVhYPA=;
 b=Hbs92V9MXGERT+VZd3it4R/pKTfWpabtQQXL8GV+hT0wVKiBQnFmalEChmftZk9Mom
 b4QocXrPWK0LOLPIMH00LjhnpT3shKBAORM411wU98lUyMmzO6CpdLpmKuxQLeNhku+U
 CcaRP930QgXtfOcDV5YoqZRPqdA8sJoQqDuIBcFV33nGY/4qVzlqeKvzVzcsNy/ad1iO
 6yap8vVRGdO6MUI8oqHMF1yjsZ9uRDxkjbq+3b0boPQp5hUPuXoYK+JKs0Lc1DeL4MTj
 yi6dM1MmcTIZ5hFloydVA3sx20R7Bw4LWJG1katz50YpvXblj4EbKNQF1MLHXJmHWJ6E
 W+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687178510; x=1689770510;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TfKugS4KjnqpQKa/nYjplISxJ/N19TWhtnUZRtVhYPA=;
 b=KAcwzN6yvEmigSj2BJytMAgv98ambnYd7+kAwaPPPxnMsqZU9X7Kak6kzBxtjtXs+a
 AJInuMeLpkEinPcNPihoa00zMIVmCdufbP9HWGPHWSvnIMTeBy0xlP+Te5959UmalFLk
 YEnGpVzO7kie3b1MYSFIe4U1tBcmz9be2aIJGq3sNJxlzD3DtzU+R8BM8VHPkC7LjHnM
 RH+MX14QOyP0JoTN4SpSs0cI+hsqJFS2DyrhH5nGvZyKfUpdpbKf142ud9hwz1sjqT5N
 8V4mpZ6K5PZ4GI69r7c9m//gwIfmq2Nja26qTEi3kZEk47ajT56WysPDYl2ERMxICpKp
 ymFw==
X-Gm-Message-State: AC+VfDzSPHLDEt3G+AuTnc7yovOiMAl0k7M1ql6h84xUrNb2uNcbHujM
 iVJyGLnTvEiGg75YFJrdNUVRlUG6BUNamsvMtP4JIA==
X-Received: by 2002:aa7:c48b:0:b0:51a:4975:f515 with SMTP id
 m11-20020aa7c48b000000b0051a4975f515mr4473415edq.38.1687178509894; Mon, 19
 Jun 2023 05:41:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230531171834.236569-1-marcin.juszkiewicz@linaro.org>
In-Reply-To: <20230531171834.236569-1-marcin.juszkiewicz@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jun 2023 13:41:38 +0100
Message-ID: <CAFEAcA9dA_Siv5aKbF8Fj6nqm5KsuzU=qjEgiFC2KR6AhyaoDg@mail.gmail.com>
Subject: Re: [PATCH 1/1] docs: sbsa: document board to firmware interface
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 WEIRD_QUOTING=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: TYNW4KvJw7Fb

On Wed, 31 May 2023 at 18:18, Marcin Juszkiewicz
<marcin.juszkiewicz@linaro.org> wrote:
>
> We plan to add more hardware information into DeviceTree to limit amount
> of hardcoded values in firmware.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

I'm going to apply this to target-arm.next with this squashed in
to fix a few grammar/format nits and add some text from the comment
in the source file about the platform version part.

diff --git a/docs/system/arm/sbsa.rst b/docs/system/arm/sbsa.rst
index c5b3342b52f..f571fe645e7 100644
--- a/docs/system/arm/sbsa.rst
+++ b/docs/system/arm/sbsa.rst
@@ -28,19 +28,29 @@ The ``sbsa-ref`` board supports:

 Board to firmware interface
 """""""""""""""""""""""""""
-``sbsa-ref`` is a static system that reports a very minimal DeviceTree to the
+
+``sbsa-ref`` is a static system that reports a very minimal devicetree to the
 firmware for non-discoverable information about system components. This
 includes both internal hardware and parts affected by the qemu command line
-(i.e. cpus and memory). As a result it must have a firmware specifically built
+(i.e. CPUs and memory). As a result it must have a firmware specifically built
 to expect a certain hardware layout (as you would in a real machine).

 DeviceTree information
-'''''''''''''''''''''''
+''''''''''''''''''''''

-Provided DeviceTree is not intended to be a complete compliant DT. Only
-minimal subset is provided:
+The devicetree provided by the board model to the firmware is not intended
+to be a complete compliant DT. It currently reports:

-   - cpus
+   - CPUs
    - memory
    - platform version
    - GIC addresses
+
+The platform version is only for informing platform firmware about
+what kind of ``sbsa-ref`` board it is running on. It is neither
+a QEMU versioned machine type nor a reflection of the level of the
+SBSA/SystemReady SR support provided.
+
+The ``machine-version-major`` value is updated when changes breaking
+fw compatibility are introduced. The ``machine-version-minor`` value
+is updated when features are added that don't break fw compatibility.

thanks
-- PMM
