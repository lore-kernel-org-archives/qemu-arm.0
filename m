Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2512785njc;
        Tue, 23 Jul 2024 06:36:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVoUS1NlJGJ8gIpPY8TPVZPnkp71I9FcrrTwH1mi9Hj1sVMmW0SHXkvbMwcpTmQssmoc4Vy3LQu4qIa5pJEDI3tz2E7lsui
X-Google-Smtp-Source: AGHT+IFYSOpEHpdqfohodGoVsQEjlwiFXcP2G1CFmn2hxbv8p8IORuhlBkDXQW5RRYC5VfLuq1sh
X-Received: by 2002:a05:6808:14d1:b0:3d9:3538:8cff with SMTP id 5614622812f47-3dae5f43219mr14756825b6e.8.1721741758881;
        Tue, 23 Jul 2024 06:35:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721741758; cv=none;
        d=google.com; s=arc-20160816;
        b=tVDewGQnNuWEzaOamnmoWDdgKbZKehN16k2UN9Nmh97/g4Q3Itf09oPSRQ5iUQPD/b
         iCTntNJ+Pb9WJQz6ykot1Yt0H9RRFhUn1/7A7mG6NYgiANf2qurerNMq5mGp1501V5t3
         bSbJxIb1i715JbZPbNuEbwNfIdxSAOdrJqSfEgXCPsF12g2Z8MMTkE7zHOS9fMxLIK8a
         CR9DOrFM7/SIoBsD2pj4OlFVRNqK0VfYH15qqamnvkWGRzCaCfp5vtNbazEpxleBKUgH
         QkN7N1QUItRv78R3aetJbwGsoKkeARJRvtFMgwfMUHr6pvGX5CXsqjSnQcNWski8G0y7
         4Iow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=TtSQA4qzE3qFe+mObrHKurmvnL+QkrVHjWKCqf70jvQ=;
        fh=tlp2Y6d3cgnq8p5sompa7f6yKadbu8KBLUaHAErqCag=;
        b=zHy/MTLeq6ZSPj/xgrBjNMK2Cf9Ehw0m1Ehl0EVlfx2SAZ+oApQ1vdgfDetivRBWns
         b2WtyGJHXy9z/5qEljth/qDL10FYKi31TK90dpifoZSf7q0UuET/oEeFXCPwmNW1ngiJ
         F1pUATKXOX5rTHtcKY9g/kD1Fn8Ek8Xne0OpFOW74mLwT87S0xTAkCUA9lJcgmjYSUMo
         OD3YwpcXG42gXOFEiRINDQGz9Qh5INfOaJiTPtfWm956PHFaTnn6474vIQddpw4DD2Tq
         PY52pZ31qRq9gOVHr0CqVvR2pxs+VNWgaHLVB1jC9kOLMVKSxWCkICGZwezyStqpAjV7
         2h4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kGtCTtM2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-44f9cd24e93si103376341cf.174.2024.07.23.06.35.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jul 2024 06:35:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kGtCTtM2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWFfs-0002L8-9u; Tue, 23 Jul 2024 09:35:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sWFfo-0002Ik-T0
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 09:35:25 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sWFfm-0006N8-Ef
 for qemu-arm@nongnu.org; Tue, 23 Jul 2024 09:35:24 -0400
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-52ed741fe46so6438712e87.0
 for <qemu-arm@nongnu.org>; Tue, 23 Jul 2024 06:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721741719; x=1722346519; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TtSQA4qzE3qFe+mObrHKurmvnL+QkrVHjWKCqf70jvQ=;
 b=kGtCTtM2yvvQlgF50zfVSk3DHWu5zAr/uzVImzsWqxUHHZm3LTKAChAEqmTHC+n+uz
 uf7JfgzEtjCHx4t4vPU220R8yzgWm8HFf3bjhk/IaWVy4prcCC3UhM+uA32/BT646bJZ
 mw7skEtYAzK2MGo2VwMV27cq5lBSITFHj/4CiBPNU4ZtxpV9hy6DBEa+zi7gBKAkNQ7X
 rwnTjUhNC7H0V7EYz5vpbgcfHl48n6P0zqgBknPiprDcvTPeIdq/0yoX/PPLy4rw+0Le
 ONaT1tCs2F9ZkTeZmk+0FaaVAFNCo1eiGKwE3Sl3kBCfokmuTvuqJxuhXqiOmdgtDHRP
 6X+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721741719; x=1722346519;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TtSQA4qzE3qFe+mObrHKurmvnL+QkrVHjWKCqf70jvQ=;
 b=I9FcnfNOUhFvRXY6WToiPthIDFnc6y1Bikkf2+c4MHkSay/85HzHa/WU47A1nP+Kia
 EA4G8a/+FA6pMnD7OlVZ46ddGo7txV6u9UrpiIUqWhAQDYPSy7+ptVAwWrOg499otR0v
 9PVjkdX3Yepmq9sHd6/Jgf2i9QsoUOwPVAxAJxPmQDkFelI0Ii36obezb8C77BwIxpTK
 Oi4BbjpqbcZB06w5sbLfUorx25uElt1X5VHQcddtHTGzM+lEK0SNIIjRKAkffO2ZB+Or
 fGrf4xBQ0+kP3/IxBzF4pMkCmQLrbPgGDBuqPUXTsdepMo7k41uoNmbHG1Bo2M9mnm5k
 DEBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZBD2E5QoDroywDlbfNHFZDw4tuVQO1etMT+h/QvgUfXBE2YeTsx6jcy9BmWl/Ib5L2tCy8NSQFcaf9ipt9+SRHQ9M
X-Gm-Message-State: AOJu0YxbyaahNE/Ss3i8aL7yN2gY6wb4Mmu42QIJ42r/9Agh7Loj0Yhr
 WjcBVLBkXAHl8Q1yoUGCz3jMBxuDeUWF/kORKexb8MOKagZzbgNHTXuRzkHUb4M=
X-Received: by 2002:a2e:8712:0:b0:2ef:2685:177d with SMTP id
 38308e7fff4ca-2ef2685182emr53285681fa.20.1721741719414; 
 Tue, 23 Jul 2024 06:35:19 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.208.14])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d692998csm174313895e9.32.2024.07.23.06.35.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jul 2024 06:35:19 -0700 (PDT)
Message-ID: <e055dc07-a7ac-4243-b97a-98c1cb702c2f@linaro.org>
Date: Tue, 23 Jul 2024 15:35:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] hw/misc/bcm2835_property: Reduce scope of variables
 in mbox push function
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20240723131029.1159908-1-peter.maydell@linaro.org>
 <20240723131029.1159908-5-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240723131029.1159908-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12b.google.com
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
X-TUID: Ea+o5KcroxMe

On 23/7/24 15:10, Peter Maydell wrote:
> In bcm2835_property_mbox_push(), some variables are defined at function scope
> but used only in a smaller scope of the function:
>   * tag, bufsize, resplen are used only in the body of the while() loop
>   * tmp is used only for RPI_FWREQ_SET_POWER_STATE (and is badly named)
> 
> Declare these variables in the scope where they're needed, so the code
> is easier to read.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/misc/bcm2835_property.c | 21 ++++++++++-----------
>   1 file changed, 10 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

