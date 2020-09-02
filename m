Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp533140lfc;
        Wed, 2 Sep 2020 06:30:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKDqkYBUfcrf61ee/wLSE5n4PCMX7iZZjU5qwny63apOFCnmoab0eUqUx9keuZ+c7nkYsX
X-Received: by 2002:a25:aca3:: with SMTP id x35mr9517963ybi.3.1599053451868;
        Wed, 02 Sep 2020 06:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599053451; cv=none;
        d=google.com; s=arc-20160816;
        b=BivGOrGW1q4LqbEqumIlILmNmgWnKrgcQfWz01+qg/I2oXGA9uj+AZFOl7suOacazP
         GdIjLJWq4adK1CBHoHrjzpASbgA7GqajP2JhkElnWStQJXqas3Bo4Byg9SBfrB/v4W4U
         iUgF5DaNpkgo23oLlWLb/Rkrznhi2AhsbiIn2n/7WRnTlL93FJVUGhPMKFMWJyaKzht4
         0ZGEkjXn4YWiEJQI0X9eIFZFJgLH8bTG1LKNtjg306qxa6awfd8+nOHPPf1qN5l2JhFV
         YtNnPuOwU4tH3qWvGm57g6WXeI+Z2hMGpFvUKpfuUw7zeicc9NoVxBXP+3+dO8xJ7i/T
         Oyaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=aJBpHbX82SVb3XqLBWoe+GY3pcYHm5JXEAME+JZaS5E=;
        b=dfjPYcoRha/dbgGvI1jkY2SIPjxGqffdXsBNhw5try9SQbQZoYt97mkj+Ei9bkd7aH
         D769cXKqb5qQwQhsfCDXNuCkNYnVIfjfv6yv8iLxJbcWfQJQhNKTRtuc19UecdzZmBbb
         hwSfbR8ZmiWZgRMudF6pP0GvFvjriR4CRg75y046+TQmmc/6303X7B19GcUSc3hVQmjA
         1vlfEfqbRVjS3Tb0dQGzh0mPLrcRkns/7sUaf9n4h5Ff6JPezKb3ciwqEsQJTrOs+vvI
         Pk06SB1wefPz/0F0Dkxp8KygC2i4yWAhpI48+jCy0ie0d/vMsbBEZ3b4LPhUlsasMupv
         dkFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@twistedpair-cc.20150623.gappssmtp.com header.s=20150623 header.b=q7VoSmPN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o185si4349801ybc.394.2020.09.02.06.30.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Sep 2020 06:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@twistedpair-cc.20150623.gappssmtp.com header.s=20150623 header.b=q7VoSmPN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kDSqh-0000dd-A9
	for alex.bennee@linaro.org; Wed, 02 Sep 2020 09:30:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rsteinke@twistedpair.cc>)
 id 1kDSqZ-0000c5-DV
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 09:30:43 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:34252)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rsteinke@twistedpair.cc>)
 id 1kDSqW-0002qO-Rl
 for qemu-arm@nongnu.org; Wed, 02 Sep 2020 09:30:43 -0400
Received: by mail-io1-xd34.google.com with SMTP id m17so3928792ioo.1
 for <qemu-arm@nongnu.org>; Wed, 02 Sep 2020 06:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=twistedpair-cc.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=aJBpHbX82SVb3XqLBWoe+GY3pcYHm5JXEAME+JZaS5E=;
 b=q7VoSmPNEfKe7OBPwWo+SrTJfS9OfcrXBoGsLhT8GZ08z611AOr+GsK2yXRte4y20M
 Yn1BOCs932cVMJ+hwQ2sOnaL0VRWLs6Kd5io2MMzVFHBRTT/4XUgXOydGidC1qoSjDXJ
 Ut1CaVMbl5er3c0ZSk9W9LUR7c30vYqBn4H1iWSM6b1ho9WJCR7gGM+ecB5AMnhqUMyb
 esc64p0kHIl30xE5L6er8xniusw96dcY+S6Kxu7QRx8FJlMlXc/+XZhB33taabofKzir
 UAS6sc5RVyt+O5ZF8cloJEQa4IjZB+ZMwMEFHXe9/neGMSNdQCUp/5XH1aw15SSMaqGn
 DeXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=aJBpHbX82SVb3XqLBWoe+GY3pcYHm5JXEAME+JZaS5E=;
 b=ejBh3LCrj+p+J3IBgXM71Dn62+07NUh3bUP5twYrgBh45+V47zwRYQIAppFFYsJT9r
 ierkv+VXTySoqHbU6rOGwYJlefHuC/LQZJY6oSO9aaWr3CtCJ5HWh0fedfS/eK7eE9sp
 KBfjPLcSmUi1s2o9cp5rmo+hFsJvL1aLvBTJiOCTAHr7fQivOKwSE1WKZLCAAtdQAEqS
 sDTYshrgCjWQT1vBw/px/+gd82Bzzp3ISQgliv0GkXhoKyNTnz+wVxaMMcBVBflsXnd4
 WeT1l98jbOVVgQtf6XXtuVYJsqxEMAi5X7Q5WNlSgJs2fUTqV56A2SfQxNVlxXNY71qt
 anVA==
X-Gm-Message-State: AOAM531zfjRRJcFZnJS1txYQI8ovuP7MxQY9+w2WuXw531RGbaYqad0y
 bShssJcmszvlqqhMfP0BeGgDRM9sqv6lNe7mZcWKgQkyZjdDvQ==
X-Received: by 2002:a6b:6a01:: with SMTP id x1mr3548494iog.1.1599053439468;
 Wed, 02 Sep 2020 06:30:39 -0700 (PDT)
MIME-Version: 1.0
From: Ronald Steinke <rsteinke@twistedpair.cc>
Date: Wed, 2 Sep 2020 06:30:28 -0700
Message-ID: <CACUpvubY7qTh7Tg5euFSqB+b3V8eU62f3kU8qdMuRLFV1UgtCA@mail.gmail.com>
Subject: flash programmer support in arm targets
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000003c9f9205ae54a484"
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=rsteinke@twistedpair.cc; helo=mail-io1-xd34.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: I519rA4CzfG0

--0000000000003c9f9205ae54a484
Content-Type: text/plain; charset="UTF-8"

Are there arm targets that have hardware support for the internal flash
programmer registers (e.g. FMD/FMA/FMC in lm3s6965)?

--0000000000003c9f9205ae54a484
Content-Type: text/html; charset="UTF-8"

<div dir="ltr">Are there arm targets that have hardware support for the internal flash programmer registers (e.g. FMD/FMA/FMC in lm3s6965)?<br></div>

--0000000000003c9f9205ae54a484--
