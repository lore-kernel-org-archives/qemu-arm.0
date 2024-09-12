Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp502395nji;
        Thu, 12 Sep 2024 05:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXotkQtashxgKfEdoz61enlzhpNQ0RLsq/KyUO9JDzNi1rXLung9g7vNZCXuZNvHfMgY1vNJS6h8BA89Q==@linaro.org
X-Google-Smtp-Source: AGHT+IFnPQomC0b+yXM26P7sXqslQ3NLiNQ3V2XoaWd59gR3MNm5YqNmB0WP8MLceAj+VRaGspra
X-Received: by 2002:a05:620a:400a:b0:7a9:c298:60ef with SMTP id af79cd13be357-7a9e5ef6749mr343604885a.25.1726145216334;
        Thu, 12 Sep 2024 05:46:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726145216; cv=none;
        d=google.com; s=arc-20240605;
        b=XLvZOEAi0mWKGIXkY50g9VpWfSpAG6t+hey45WNC6gMSibUHt8G+xoC7tbhBBtHcc6
         bQTHt3v4QqezGLUWKKfv2R4ixuYv2PVc40qS5pxf+pYS4iDwkFJV6dVVT4F/5GwuQ+KE
         Z/vlQp1dGe2XQMX5SgR9hHQp8NAqoq1jC5Nju4vqcq49f3MVqOdCqV0ryfXADaAvtERt
         4iOx7n+cGDWQ71Uj+XDC3LOHhA+BGMOlBVrF2e4a8VGTIuRaRh67qMbdIt63QdQbRHum
         eSdHX/WoFRC+rsRnE3/MaH6ShCR4gRkJuqjUHRbFw71nagXth4yqhlFB9p71lYe45wPl
         LjaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KoMRi3kCgu/r+16U7v98jk3LR1SD4e42KIxnPWtgzOA=;
        fh=HOQ6tIHu72P5LDBEwnclP222j86/FexHezLu4bCdrBo=;
        b=hE22J7R24a7Ci3H7hwP2tPSlDZzKVv8HQwTvpHZWbcRXZgoHEMDYSy7B6JUtHQ9apo
         mg8ldpYhYhVjtxqDN/yidRVvaTjC7UszmY76Uz08ezkvbdPyMG3YNW1TVC7WhZBLx7yk
         YsGMJ0p+Mv+XR7KySBMWqbzBEda/Zyi0CeorDff68MlCozZdGnYa+Rsjs8ac5pAYe1YH
         MUVzkCRr0ZOPt3GtJwvszF0JCx9UsuawjhEKrdHBb9FjUONv5P4sAVDG6aoek/jjhcJv
         e0Za5HIEMKhuhg2J3m/tJkdWwfDRFjY42DcgyWp51yegdQk8tgwr5ZsSauvz5J4j3j8v
         fQgA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S1JBdGh7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7a9a7a47bf8si1288157185a.503.2024.09.12.05.46.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 12 Sep 2024 05:46:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=S1JBdGh7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sojDf-0006Iy-Ea; Thu, 12 Sep 2024 08:46:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sojDe-0006I0-03
 for qemu-arm@nongnu.org; Thu, 12 Sep 2024 08:46:42 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sojDc-00026Z-9B
 for qemu-arm@nongnu.org; Thu, 12 Sep 2024 08:46:41 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-374ba74e9b6so980391f8f.0
 for <qemu-arm@nongnu.org>; Thu, 12 Sep 2024 05:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726145198; x=1726749998; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KoMRi3kCgu/r+16U7v98jk3LR1SD4e42KIxnPWtgzOA=;
 b=S1JBdGh77XAgF96dkhb9ezbHHo3W1qzhnmKOP1DellC1+uo5QSupafKzSVEJXRa66J
 EGd3MKMOiaQ6rId0cQwMPXA3hw1f63dydORX5DyMQKk8AkRljCvs87GVBlxDRng+HQYX
 qMZCZbmsRseqQrw1FoKUyim/2k/KGMYw32YDTsqyQdBv2MCf7ZIG3puxt2722uCoil+7
 fM2DVn9Qwu0l4cXL98skIWr+XmOmHdkJvbyMiSINe6SkkNMMesQDeSaC3OHCPc7B4zsJ
 MbA5idfV4gR0VLL1YlMSmwRlOYgyN/bibK6ZCk6kVCwblmfRnQMbckLzW9QbY3ey4SMP
 rP8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726145198; x=1726749998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KoMRi3kCgu/r+16U7v98jk3LR1SD4e42KIxnPWtgzOA=;
 b=kz9itMufVy/VfXu5raC8wSUJIJWd7j3/WGtEUS3p6QQoyn647gPnUX8YCZF0bN7U3W
 l6aaTwyG2o9crjrG5vzcMpIvB/g6e4dqnNK6ezC9RWw4Vot+RaLAwGq+Qx77R1VkZCBs
 lW6zzVHiPSjuu5Yx86fGiUq+9PdY08J/0exc9LGlKiWvimbjDowLAAoeArM5to9Sn75I
 Vwykupb34/eOPnQTGE+1lr6eVy2Ecq4bm1l5r8iZ+4bSMEkC7Ri66wFWhrqV/jz2BJib
 CibiRXwMXPqZk2+JrJczvIYaJFwQ3eckdgkS93LMnH2XMyWq4bMGyJi+fvNOSaILMd7d
 62+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUes66PKxI+xwznHTTu8q8oKeiGXdGVcdR/9oHq/AQKS6wku6NJ3Hcoy+hH6YPvurhpZs3/RLDdiQ==@nongnu.org
X-Gm-Message-State: AOJu0YzPE2MyItbEPTM5bxw7vU1smQc3lOToy78WXFaUeQtI/owW9pRv
 jGPOHZsq+v8N+eTUR/tfPqLn+A4jVl8UYmRtGkb1oq0zcYmxQjVQ312OsnpDIxa3LUXjdEjyYnO
 5CtQQSA7JdbGm3FLTpXN90DQO9D2ZPoP0D4xh2Q==
X-Received: by 2002:a5d:62c9:0:b0:374:c11c:c5ca with SMTP id
 ffacd0b85a97d-378c2d4d209mr2006941f8f.46.1726145198290; Thu, 12 Sep 2024
 05:46:38 -0700 (PDT)
MIME-Version: 1.0
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
 <20240912024114.1097832-27-richard.henderson@linaro.org>
In-Reply-To: <20240912024114.1097832-27-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Sep 2024 13:46:20 +0100
Message-ID: <CAFEAcA8g3UbfjZRH0VMX0=owDawvdjp1gUnnK5GoNn7jYK4O8Q@mail.gmail.com>
Subject: Re: [PATCH v3 26/29] target/arm: Widen NeonGenNarrowEnvFn return to
 64 bits
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: c8Uf4s9m77Ig

On Thu, 12 Sept 2024 at 03:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> While these functions really do return a 32-bit value,
> widening the return type means that we need do less
> marshalling between TCG types.
>
> Remove NeonGenNarrowEnvFn typedef; add NeonGenOne64OpEnvFn.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
