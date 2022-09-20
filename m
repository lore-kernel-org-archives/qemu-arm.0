Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1793823ejy;
        Tue, 20 Sep 2022 06:44:18 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4v5n/388yFG5OoQBrR3jX9KVSZ+h5XOzU8lnbJp+fzz9Cf6wyQmv3cc0dPPnVH+Q8Br9gm
X-Received: by 2002:a05:6214:f6a:b0:4a7:fe99:a39f with SMTP id iy10-20020a0562140f6a00b004a7fe99a39fmr19246752qvb.26.1663681458383;
        Tue, 20 Sep 2022 06:44:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663681458; cv=none;
        d=google.com; s=arc-20160816;
        b=Qd6LIwVj9+mnvGCnE1LY4DfJPkPqSuCSxwKbBDEXOi8OaLXt2uH7eCFI618lF+ECoC
         zKPIRL0HdkKIPg0OZ1qCpw6lgFv7AfICgvCeXlIIgWIccu98Qw8RT6UdG3NjWs13hghX
         qQhn/uaYRlVGol6O4GIS9+0nl8Yry3JRb4B64xPzm21edWyOUYoESr8N7+6aK1NiS08V
         UhV8N4r3p2g7MIK89LUh2HU+/BLH3XgKsgv5dmohU55XP+eW1kGMILALODVfS45RuNbe
         +H+LsOLTaIIX15nrxlc5euwp5Sb3Nk5gtv3rWg0rRwJUHqkFzZ2XutWASnUz7gtFaojU
         IobA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5mr4Y5RdId+omuTpYV9/bPWYx6x+e2AED17JsG4+Txg=;
        b=YGDRZZxBzjO61BYnRlNCUHw2ky2RKdUHh9H0LiHTwNIjvclaj8bgOPyPR4JsIYTAXr
         PxP6+r32PoE4lNT/mcsadtjohBkPfgPNXSfngiw7W7YU69v66wf35ixQYNcZLOJWjZmI
         mZ9ev9nM8UE5E5y3xasxLXCxcSnK+hP3/15GD+ji8BepzTObyZwKdeFglONlPJZxzjho
         VDOZNilAcveco/ux6ZPmfCvKU+xMO9ekTazhDZqkkdFtjUuv8cEM0olyI9KNrmzjD57y
         HaBwG2GZioYth8Bigy0pdL0W4QekSq2WfubiseJ6jozbA7Bq5ZrNQb3H7guQWnOVhkBv
         4knw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xho2FtAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m9-20020a05620a290900b006cdece7e4e3si226246qkp.457.2022.09.20.06.44.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 06:44:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Xho2FtAb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oadXt-0003sa-T3
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 09:44:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaajJ-00017T-R5
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 06:43:55 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:35472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oaajI-0006vN-4X
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 06:43:53 -0400
Received: by mail-ej1-x62a.google.com with SMTP id go34so5156746ejc.2
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 03:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=5mr4Y5RdId+omuTpYV9/bPWYx6x+e2AED17JsG4+Txg=;
 b=Xho2FtAbi5CM7MYsV5lo3JQXMQFN2hyEv+L2P0klhQbQWoRFX7yvbO4RlKGLuARTGg
 RgzSG+zc2WZxl32iGma3UQXinKdHFwEnWnv2aBMPh/R5PsCz4urj6KRh/2oCUdAiyuhu
 WQ+8SVO1GH0IQJtHeLm2LVK8mgy/bFYhjKeUydvs1fvhNj9i+miZzhguZxhx4DdXWTtj
 FXrz1jSiRJ8Gt9wU8999DUiQdaK0Chhr85I/fW7VELn0KN9j27duug2LCoEJHfTYk8wJ
 +nTgi8QTM0NpOLhilWLatGGElDRA7krBciZ9gyrMQBvsVJ1yWmekgFV2otOuAsW17j/R
 ViFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=5mr4Y5RdId+omuTpYV9/bPWYx6x+e2AED17JsG4+Txg=;
 b=egm3KYd9wCBQ2ZTnCyWb9XV3Tq6PLHwfpyzLy6G640yL49U/Q/pM0occkBYd3zCuc1
 7ieTmT/zUtsgorEA4aMskYGSvXl3pNsp4ShWehZVVNuwIABm/+tajpzICLndB/1F2dC8
 X/ojoEkXxslX6d/pELG6Z5MXqx/KonXH0E9MsKxqohc7QE/58Siuc18vz4u1coSo9bC3
 yeP4sv1yEyG6W0aL6matbL2plg6YqLvgpx9gWVSoXt2iihhbgOqjuVZe8RnQgjS0bZ5E
 j5OSt8MO0z9RbnitQApVWooK4ks6I70T0apA0iHJowxbKk7WMQlT9Qw3/mMpU/iOgj7G
 GIXA==
X-Gm-Message-State: ACrzQf1LQExb+poiLiX18MWF0b0aiFaceA20GrfLmgwEFf9TGgVJNaKo
 5QNDxWDZJrI/M9ssTRPxFmWB7jOVm1Z8JXzHipMOAw==
X-Received: by 2002:a17:907:2bd5:b0:76f:591c:466b with SMTP id
 gv21-20020a1709072bd500b0076f591c466bmr15672770ejc.504.1663670630722; Tue, 20
 Sep 2022 03:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220905202259.189852-1-richard.henderson@linaro.org>
 <20220905202259.189852-3-richard.henderson@linaro.org>
In-Reply-To: <20220905202259.189852-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 11:43:39 +0100
Message-ID: <CAFEAcA_mNbBujzBQFvs4WLkGCnmzjWJq37NRn3e+7qN8470NcA@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] accel/tcg: Drop addr member from SavedIOTLB
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, qemu-arm@nongnu.org, 
 pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: tolf9fNEa/Hl

On Mon, 5 Sept 2022 at 21:27, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This field is only written, not read; remove it.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
