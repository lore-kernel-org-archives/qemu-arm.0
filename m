Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp551759ocs;
        Tue, 27 Sep 2022 06:13:16 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5TOr7q5xf9PxGzc5SqAezBJfNlzGQ4t1BseLbTkJaMJrt1A0gmJaogbly6+B04uNXNjmLa
X-Received: by 2002:a05:620a:4686:b0:6ce:93c8:9973 with SMTP id bq6-20020a05620a468600b006ce93c89973mr17808795qkb.714.1664284396654;
        Tue, 27 Sep 2022 06:13:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664284396; cv=none;
        d=google.com; s=arc-20160816;
        b=plVxXoNIr6uESQieGjLoOF8hs6urolNUMc4O1vZNy/xIlH04AEq94+jc0JUEEvJzIJ
         xoxTnDE7jjLV4gowHtcSkSjZ6gxHRUZm5r9OLNdopOxYfUbJ6AzaoI+w6GksIiazktG9
         zNUfSH++vH+WEU2RloNx7CO44m0jt0HweWL64xr/XtKj2N86hMJgB8v+fVyvYUVlssWM
         qkfc09luZ2AjQT9GI+uG2PsXBgSzRCwwmkCb38YypRwK2dmkfREsaqtARXc0PxIv4lJT
         YwwFq4YcZGI/tUDwK012ppxhVnhjIiL+5VcgAKAYVukShudekj8Ysz+xU9c1RgIO9qvv
         WyNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xOLYmcjbYK/sXr7E+L5WXykJniMAkmkPex513RoQQrw=;
        b=r/63rzU9y/yGdYaG49EOcP/G2arsmjzpEeuRkRcpNaRYWEWYyLYY5q5GQVV/pgRAN3
         FANjoS4EXd2A0PBREm+mv0gVESwWnNa1dOiGTOl3Qqgn1S9Vk+/pKVC9ipl9v6nQKXJa
         4dxLhjARL0egLtr5sAGiacmU2d9aaOzgpJlGoFJDBwSF168F4mlEONKQ8IY/jGeHNgHK
         9O0otMO3dBoeIkuRFWvD38blVN1mwqd+EWGfm1v9MwToRBjRpKZZsp6v/+EwbjH5cEoD
         qeCKjPlx6zVWpws32BwxW/GGh6K06nnA5tVN+fE4QhrarQ4Emtz1lGDdfaE+KrYfhyST
         fAPA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vl6f14ln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t24-20020a37ea18000000b006cc634e53dbsi734898qkj.270.2022.09.27.06.13.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 06:13:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Vl6f14ln;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odAOi-0005bb-53
	for alex.bennee@linaro.org; Tue, 27 Sep 2022 09:13:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8qO-0003nK-5x
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 07:33:48 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:42641)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1od8qK-0003i8-Dn
 for qemu-arm@nongnu.org; Tue, 27 Sep 2022 07:33:41 -0400
Received: by mail-ej1-x636.google.com with SMTP id sb3so19999107ejb.9
 for <qemu-arm@nongnu.org>; Tue, 27 Sep 2022 04:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=xOLYmcjbYK/sXr7E+L5WXykJniMAkmkPex513RoQQrw=;
 b=Vl6f14lnEOo95rOzL9beorLGm5Wf2CEcS9amaG6gth4zV2uM5xZNl7Ydk/Jzw2QdDS
 53uIanDez8tBt8bFVYwM0AcwKyRA8r5HM6YGY/VZlzBXR4VCJ2XETFcosWziqc2VMlZt
 +I6e7+SZ/M8B2p1ICEgB3+pvhx7C0gHBtKzGdlryI8fKL7tFNQuPGbfQyhmECis8rKCV
 Xvad6jt5i8cItE+Qgh+79sdPVFYbshwwjpQh6BExOG1V1Y7S2hcFl4Y3F/fSBFM1a7Pi
 KA8YYKOwmyUuELl+/DE4z8m/4gZeSAh1uYQiJRbfHELzYdrycovDO5HLuHFscDfXHyU7
 yHWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xOLYmcjbYK/sXr7E+L5WXykJniMAkmkPex513RoQQrw=;
 b=OHiMjrGkZ6+IpNgTcETTZOP3faUjiLGqG/QMJmQlmOIjbVY1J/VFsJrdap5MR2Y2vB
 GpLFjCV1rCMpRuIVm7MwxOXtbtOXQNaQdBY0asLQUw8wZPuds72RvwSBoHtY6ySfZWwL
 WR+cTsQ7Bcb+H1BxxxhhVSwePdAg/qH4PBd7tui/aEf3M+kf5lvdyv1ATIFRXAA7TnnT
 +WZOngx2qulZoF+mWk3zr7eAuT9I2Fv1HBJadxGxMnkGdF7IRrl6qnfzgyW8gg7iyZm0
 O6eurrH+mACm1a2E2zqhHW/aIkVQN9cyS069xR6HQ3cbJqZ4PLnLKWSqLaCz42WAuI0O
 YLbA==
X-Gm-Message-State: ACrzQf1a/RmHB3Tf6sPIUFiRymHAdtl2Omg00sxCmUEjTWJ/JghJiHqK
 Uty0Uu/ZhPlRNCzDdS1iJke7j56V3ubosXu8pwqtvg==
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr21413204ejc.504.1664278418551; Tue, 27
 Sep 2022 04:33:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-3-jean-philippe@linaro.org>
In-Reply-To: <20220927100347.176606-3-jean-philippe@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Sep 2022 12:33:27 +0100
Message-ID: <CAFEAcA_oe27kvXRmM8n1Aww-OREQx7yOYn0NsC=55R7YEGS0gw@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] hw/arm/virt: Fix devicetree warning about the GIC
 node
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rPYKwXb0IK3a

On Tue, 27 Sept 2022 at 11:12, Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> The GICv3 bindings requires a #msi-cells property for the ITS node. Fix
> the corresponding dt-validate warning:
>
>   interrupt-controller@8000000: msi-controller@8080000: '#msi-cells' is a required property
>   From schema: linux/Documentation/devicetree/bindings/interrupt-controller/arm,gic-v3.yaml
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
