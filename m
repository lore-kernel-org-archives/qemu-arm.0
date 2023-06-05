Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp2891040ejb;
        Mon, 5 Jun 2023 09:02:49 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7dS/14BPzdpSiylHtvTWOVNjjgtqaW7tOk4DQolNQHD1sAIYEWyV4n4lmrLahFkhfJTPtn
X-Received: by 2002:a05:620a:27d4:b0:75b:23a0:d9f7 with SMTP id i20-20020a05620a27d400b0075b23a0d9f7mr51451qkp.77.1685980969109;
        Mon, 05 Jun 2023 09:02:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685980969; cv=none;
        d=google.com; s=arc-20160816;
        b=ooI8agPn8gFyuCc9KIECO+kg2jJTsuBUwfZ0QcN+eDpOLOogPHQJ14842BALc6s8tY
         YcSrac7pz8ti1xuP6tn6152zfjUCGuV7pQ/zcYHNN8/NJwP22EemDcmAJoQ55tSlrw0h
         1NVFbX6MLloz24Zca0wocCFbKJAnDomFGh1gMv2JWbVXvgGJ6DBHR7lKsjJEvH411OZQ
         m4aeUdl9/WbXl94iVOq9gst7MRotBdNd9T7aL6n5TtSFrIfrozB3Lt/vnNW6Lat2n53b
         bKtblfrZ8oBuh6XkXr8A2BW+766wbQqakCvBDv0vum+oQKPmRgo9bW1hDQIIJKqJsELu
         IXiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1JAtbcSNKgU0t2U2g6dUjEkJrGmtNP72vjyAOFMxEUk=;
        b=IPB2AoU9rEM3LeG0MTYljk8hVXBqX5roO3qIx0MGI3JpAvqVyU10H8FmA/yEfu4bCx
         MXTqiYWAypg5tMAu4hGN7YYlE5ajDvQxJ7eNC5e3i27EHUaS4H6BhfUmR4Q4XS1ZYDf+
         RFtbIsb4ezpGJu0WJ68F1iorR6Y3y33n2VQq9LJGPjC+SDaT8iYKgMCcGGlifezpyF5X
         hoiqo941FwoABOrf5HL+pFKATBjnoNaLjcUT8qEnUvpEqatAF0LonMQ6NYlqksQ3zilo
         jSI/PIiloqicKxMaeu/YpETZ3PEYyCKNPrkx6KY8AFLc22TuOI3qcXo2fhcsNaMErWDV
         32Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kWQuS2ut;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d20-20020a05620a141400b0075cb417c4f0si4521817qkj.488.2023.06.05.09.02.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jun 2023 09:02:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kWQuS2ut;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q6CfK-0008Bt-N4; Mon, 05 Jun 2023 12:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6CfE-00088y-6L
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 12:02:39 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1q6CfB-00052J-Dj
 for qemu-arm@nongnu.org; Mon, 05 Jun 2023 12:02:35 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5149429c944so7674024a12.0
 for <qemu-arm@nongnu.org>; Mon, 05 Jun 2023 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685980951; x=1688572951;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1JAtbcSNKgU0t2U2g6dUjEkJrGmtNP72vjyAOFMxEUk=;
 b=kWQuS2ut2JoAUrRwJ/ny6QPR2nzrLpgGxsFtgxR5uufjaQMyB+/yqc97I2bigVzHFS
 x+bB9FHtsczn8Qg7lxfhdYpQQrX2o3elDZ+MCHDDj1XTgQ+4CkKBM2BoibHom4zNZPy/
 3RmIzXTpbwJt354B+GsP2LZze1lsvGwIOV1Ms7r88P9HxgEo5HwAA9za+a/khUQopBC3
 mszQHL0ICyGYI6EROhOWHfUfEoCjYO/m+zdVBnSBq2N8qFUA/cOyhyXFCMLlGk0C4gwN
 /MRK/HqVL7MuLxd/GGp2sYQlG73ECMhoargPQQBtyWvcPT8xFwfIFtKG3TB+av5Gi/rK
 fkdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685980951; x=1688572951;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1JAtbcSNKgU0t2U2g6dUjEkJrGmtNP72vjyAOFMxEUk=;
 b=W9zK4aWVShqjexAB5LBh9ee578G7Qm6oP447bBM4JttRS2c79yecmSfbN1IqOY6RGZ
 h3Ldwbt6+BMbGmlb/GlGt2Q39SEBfGkzcVCFWFOx7emgCgSYXbq5Q/BVo/LqJvhG5BIj
 LAH3koL+5C9LxRO7LzHLUiTbQZqz/XoNEi0eqeTa8UI13/X4c12yGfsDONFS/q/v5mBT
 N9ORLnGh+anp199x73L7hK4fx/baz8OzPulDRSrZSibzL29jvNFbuEyDkOhgLn71qPaQ
 YgQXez7+RlhT1mmeMKrniFL5IMvGhYIqfCnKQpjPv6OWz4yBS6VeNc+ZmWMiF5b52iP8
 huPA==
X-Gm-Message-State: AC+VfDxWQlg6fz/89SWC9pWd7NFP31NUi0ijUPfGhMCbhoy1/eGLz8Yi
 fu4/CeHjWFyxIDL6QPqG1A1BEwJvk8KL2zwQKr9MMQ==
X-Received: by 2002:aa7:c650:0:b0:516:4098:66f4 with SMTP id
 z16-20020aa7c650000000b00516409866f4mr6330914edr.18.1685980950963; Mon, 05
 Jun 2023 09:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <DS7PR12MB6309FD700EF00EF1EB541CA7AC49A@DS7PR12MB6309.namprd12.prod.outlook.com>
In-Reply-To: <DS7PR12MB6309FD700EF00EF1EB541CA7AC49A@DS7PR12MB6309.namprd12.prod.outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jun 2023 17:01:57 +0100
Message-ID: <CAFEAcA-rjY2LGn7fW4d2Cn4J-7pURQPVdrXmt+bn+623Coah=Q@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] target/arm: allow DC CVA[D]P in user mode emulation
To: Zhuojia Shen <chaosdefinition@hotmail.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: gYuQyfbd3x20

On Thu, 1 Jun 2023 at 23:09, Zhuojia Shen <chaosdefinition@hotmail.com> wrote:
>
> This patch series enables executing DC CVAP and DC CVADP instructions in
> AArch64 Linux user mode emulation and adds proper TCG tests.



Applied to target-arm.next, thanks.

-- PMM
