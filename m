Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp720991lfq;
        Fri, 18 Feb 2022 05:39:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwbs3IZ4e8L+HVhZTqQhhdHMVfRz/mfTICuJud5OJMoLXcng98VB3eKhTnplCJWGIekirz3
X-Received: by 2002:a25:b991:0:b0:610:bf4e:1b33 with SMTP id r17-20020a25b991000000b00610bf4e1b33mr7390081ybg.352.1645191596553;
        Fri, 18 Feb 2022 05:39:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645191596; cv=none;
        d=google.com; s=arc-20160816;
        b=lgW7I5bYVWBHNJ4UVbY1SnYIBAdtBDO4jU25X/LQkWxsW9u+++GvWH29GaBop+h/zY
         ctkWhTOSHlr9qAYLm/PFdy+6j9P/R644AcyGl3jrk/I0djPoKQIyDqTC/WddqSZnHYQc
         XUWpyYfLbPCfv9BBNy97s0uw7T5r7BDqTUOsBejSvqUKrhPfcofGWnbqVSDaCn9FV2+p
         Xynyg4jBkxeqbYPxX97smhnYmFtaUFpAZG2XJyyOuSwyMU7r965GymJcGt+CNnNh+p1d
         d+ajlAOwO2Ueuv44G91SsI0opUE3Kv/ru11/Nn1F0r62P0yn6l7xPsAYY712/0bcRcKb
         Rm7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=48Q0MoB+JKlJrHkgyZJwF0xBdNZQVzPHaoc8KSQ8+2A=;
        b=jx/McMMeS1E4grRgOmcXEC0ymMgS5JSlqx34KXPAiPclfyb49iawTOfU4uBQ77sbU0
         pc03xrKmuYBPSiu7DvCJg+mFZ8OdThpUtRVs9QGfQFYiYKwPuz0Gu3s29t3KJnsBgtKQ
         AQWUNFsW08bMOztkMluSxYc5slJOQwXYI2LzKdP4DNq9InC7AlOd6/P18lNUws9v9trV
         Y0ni5cj/5O0t+MGF6WmLr2tPcARJzJ4+qDtq1fU+5TaZt2glSYsxsULmZro6jvcdu0wY
         sRzLw6cPQjr0do6aDIrbnrYx1q7JraVet6MisOJZM/zcuPiXewPBuUDTT6PUKlUIQEFP
         af5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MtjJQMx7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t63si34129909ywt.103.2022.02.18.05.39.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Feb 2022 05:39:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MtjJQMx7;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nL3UJ-0002Ib-Ub
	for alex.bennee@linaro.org; Fri, 18 Feb 2022 08:39:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL3SY-0002GM-8I
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 08:38:06 -0500
Received: from [2607:f8b0:4864:20::112a] (port=38206
 helo=mail-yw1-x112a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nL3SV-0002Vq-CI
 for qemu-devel@nongnu.org; Fri, 18 Feb 2022 08:38:04 -0500
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2d07ae0b1c5so66534717b3.5
 for <qemu-devel@nongnu.org>; Fri, 18 Feb 2022 05:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=48Q0MoB+JKlJrHkgyZJwF0xBdNZQVzPHaoc8KSQ8+2A=;
 b=MtjJQMx7RbW10sIXWaq+W/MM4r/hr1B6SP7st5+XfMIXjeDbkOgYkBtzYmDHvQIFlM
 bzI7Jzmg58DSJhhAdXXEBsi6FCasVy54o2qUrjtXwu+1a4fREKzTkrMkF12NK+w+hR3F
 J70+QaVX8Q2rHB96mmQOOCPwtdm7VgZLrS84I8rmiJqSo3peXfotZgEBFT1RO4VRgj4V
 AJZvYCySjjtecJkOiTqI66zSIIn1La3m9ADe9bH8rz/JzFEgDCk3alXN7xXrrgo7oKEO
 9bo8QHpjFYL4tGqfDtjqUSo2Se1ckx7VmFT1IpDuwj8OFuF2B2zEbl7wq+0YFf6jFTAF
 /VSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=48Q0MoB+JKlJrHkgyZJwF0xBdNZQVzPHaoc8KSQ8+2A=;
 b=i8s7kw9828SKeTWV9iywW4Yx4Y7zZ8h7giU2EmUG492Ozg0YQZoghaQ5r7dPINfpuK
 k8fC2K6v4VJR5nxoJ/P6Gp3bJfNOM18jwivMLCT+AGYPEAOX9TaC3XyPLIk046AzyNrl
 QzHdmHQU53ZMSpqlh43KJesz5N9ORV42HZ0XMAjMLJWa4Mb8xOPx1prQUA2rkyiUKBxD
 s0k8p+VdT2CYtXaB0Vxg0aAzMsUrmguNO2Psa1G7/JauWUlJb5UnBcWGWyVjlrczpZSd
 EpUHCT9RcuFfUOgX+pMzxzDFu5GP/ML0XqfO3JR993Rq1a+KxVfuCGT3UBWZ6CNhsU2s
 UiYg==
X-Gm-Message-State: AOAM533rLR98VGfGmyYxYuv8H6gHXxC4sHMljl9Jx3EYCwE+dTR95HzJ
 swf8asl3CS0uJ2ncrgcdUSTrl81mJBtrgDc9tLhGOg==
X-Received: by 2002:a81:1006:0:b0:2d6:e14a:ca72 with SMTP id
 6-20020a811006000000b002d6e14aca72mr435456ywq.455.1645191482417; Fri, 18 Feb
 2022 05:38:02 -0800 (PST)
MIME-Version: 1.0
References: <20220203140141.310870-1-edgar.iglesias@gmail.com>
 <20220203140141.310870-4-edgar.iglesias@gmail.com>
In-Reply-To: <20220203140141.310870-4-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Feb 2022 13:37:51 +0000
Message-ID: <CAFEAcA9joHJr=tekZAV4fUX-y7nHcOq5JHTUFDFDhxpsFr1=ug@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] hw/misc: Add a model of the Xilinx ZynqMP CRF
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::112a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, luc@lmichel.fr, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pPiDH5VckNJS

On Thu, 3 Feb 2022 at 14:01, Edgar E. Iglesias <edgar.iglesias@gmail.com> w=
rote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add a model of the Xilinx ZynqMP CRF. At the moment this
> is mostly a stub model.
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---


> +#define TYPE_XLNX_ZYNQMP_CRF "xlnx.zynqmp_crf"
> +
> +#define XILINX_CRF(obj) \
> +     OBJECT_CHECK(XlnxZynqMPCRF, (obj), TYPE_XLNX_ZYNQMP_CRF)

We prefer the OBJECT_DECLARE_SIMPLE_TYPE rather than directly
defining a cast macro these days. (It also provides a typedef
for you, among other things.)

Apart from that, and dropping minimum_version_id_old,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
