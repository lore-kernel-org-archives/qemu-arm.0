Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp1298055dyc;
        Fri, 4 Jul 2025 08:40:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVuWKnN/QAjrmHoLUguqecQKaWOqbwXfTMnOMop/IN2retuPmoipf4qgLbj0OBNzUSyOlXayTSC8fElsg==@linaro.org
X-Google-Smtp-Source: AGHT+IHPJI0oH00hxZg+sBQjZhpi/HJrVm/y7H/lAxbxBFIp+TxBS6zOZs9WMJ8hXVl4roen3AYK
X-Received: by 2002:a05:622a:15d4:b0:4a4:2c75:aa5a with SMTP id d75a77b69052e-4a9964ff6f6mr47549481cf.30.1751643650485;
        Fri, 04 Jul 2025 08:40:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751643650; cv=none;
        d=google.com; s=arc-20240605;
        b=OZvZWLugNh4HPhWZt6r3cQkkQvUZR5ACaZdX7sBjExUSJmYJLAX2h+bUS9UjINcHIt
         ucD6fGBkef/AuDMh2ghxZu2ZsTYg+YJ0EwgXK6ePx8lNJt5jOfDot8nc3kuzwb0b+1/W
         ndJrqDNXSgvy0Vu5x+o3oEERR+fQHX6nN+GwsRyodacueip7YYpzt0mU9c2cMUuQ7DCB
         eZlzSb0Xrl7vdhLwHmTmWpOK080GFiy/3YTBfDj7iGxMJHzo/nYMGKBfjvP+L+E0wxdY
         8e1Hi+JerTkQRDCp5IPP5vOfLET1GKrzbs/oQApX3Rep0VhrruXfBVH9mDe8ygHqcXv6
         XfHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=4eHeWA/GQGNp/88g85GnxJ2dZI4A+ddZnlpnJQ674o8=;
        fh=zLvtcTKKIz5DGo6KzpTAPe4x+7LNCm1NxnrtbIaMFgo=;
        b=SbNSmHgtIzLM95VcOk5OGmRHV/optjw0CVLxOx4fVApxiPUSPu6OArIG5xrf/tVavW
         egpgwuxB46jgQP93R1NyeJNf7BAfim5hxsKidUxzW0jSwmQnIFqiY6yjLBFNT8ObkdA5
         0vE4hE2tbccesYeJkxDyL4YarP2ILOMU7G/hVs7v1npJssl3JnNkNMMfcKEYq2QZi1jh
         ZlDQNhNbdUAg067rinwJTSAf4R8zAp34uQq/kA5tSA+IUDLKMm9Taw1IsYRtrn4lJpUg
         su67rLUR1Z69qxdctdoBhCpa765McC7tolxY32dQTg/xujb3xnajX6TtZ8cvGKpqw3bl
         7ssw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EwyMOe8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a994ab1ad9si21255481cf.182.2025.07.04.08.40.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 04 Jul 2025 08:40:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EwyMOe8Q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXiWs-0007OP-Tm; Fri, 04 Jul 2025 11:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uXiWq-0007LS-QQ
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 11:40:44 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uXiWp-0000I5-6Z
 for qemu-arm@nongnu.org; Fri, 04 Jul 2025 11:40:44 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-454ac069223so11169375e9.1
 for <qemu-arm@nongnu.org>; Fri, 04 Jul 2025 08:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751643641; x=1752248441; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=4eHeWA/GQGNp/88g85GnxJ2dZI4A+ddZnlpnJQ674o8=;
 b=EwyMOe8Qxb6a+tN2LfmMIiWv08bb1yxms0swjVq9+k3VI0QdHS9a+7YVeGz4sez7j4
 SMtUovsUcra0kGcVuO75SFDh07/WFG/N7RQjpCV3Erqsg/7NpD3FeLqpAcg1KFC/9Uoi
 ocAcLqqCQAUIldlOjF3E3wUZQIqsx7OrzxByzVZCj66lBjKTR1hCbV/MEFww/fnHV0HL
 QGqrVWI/giAm6MDlzgRS1s0M0WqzF4W9rbHqywWcwjfzrqpDn5/fZdOnJo8OGS7Ti05Z
 fBx2BadNmviPtaIuleXETugSL/aWX1SQhQHzD32TTFpEM1AxhAah1jDjIM/OujYk+9v1
 arrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751643641; x=1752248441;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4eHeWA/GQGNp/88g85GnxJ2dZI4A+ddZnlpnJQ674o8=;
 b=CRQYtYeUkuiQwaMUwxY4PQSML23U5xV25wLBWvo38H9miNTeR/cNyeiI/LFEKHnrBy
 WlbHe4xGK/EgcPtHB7cj31va0MOfcyYxamxyNP4pY0OBxRYtxTrbdEqSPL9XePzzl8hC
 8JHf96Sp4mfTMjMQyMe8b+3tY/ZqnNzB+VsJyBf4P2OMoBcesGWXeXNodZCLYXAuwrqk
 t+p5lImdW43ZHJZXBiVNuKLXO0FTTECgSl4EMv0+EYMpi5Wi8QNWPv0lv1gOwM++i8nc
 8+VJgoU7+B/n6PaAo5CoJQpCVQXwoFkRfI0sHqPmUn6K99JlNGvL5TLRUtNR/CQkyx4q
 HH1Q==
X-Gm-Message-State: AOJu0YxFt7h3xBrPKanHH5yO3trXtUOZAeP3sdLyVPhYHuk20CvztEDA
 Tuio3E5wGfo+7PwsRjHfbCw91k16APgkIqdq5FdnZjFCQ07EQwktla7FpCcBjBcrOwD9T+FPBMP
 lTuZQ
X-Gm-Gg: ASbGnctQkhHt/gpEi3NBdOOUr1fuzsBInZ5yuodm6hPGOHjrJ6zZkXC+8jocv2DU6h3
 KJ13WEn5TYNIGBWzGBuGdt9SA0PA/hQfQtsQ9WJZhwTEotH2s2msQbfDlzkETbRm2uSPOr6vifY
 jsO92iHn2+MTmLudr/IIJglhWkmXmZtdZft6DnTAeWGTvRT5Nj5rswR/JF60a3rLrKzKaDdhbOH
 E6+ACVF6kPHqAeerBsOuLyN0g7qgr6GpZXSbAw9+0S/p+mmc/RXxbzX74KXwGrobwH30ofMJ4cx
 zfmKFvdUxyVaAAl+vR3uAq8KgW1n8gdEBr/GCiguEP5FB+Av3uNH5VygZYh+CnxVEbujU0czCWy
 wPTat6OiGSbkvxG7e/DPTgQnqM2HaVUizVWQ=
X-Received: by 2002:a05:600c:15cb:b0:43c:ed33:a500 with SMTP id
 5b1f17b1804b1-454b262bffemr21700525e9.10.1751643641530; 
 Fri, 04 Jul 2025 08:40:41 -0700 (PDT)
Received: from [192.168.69.218] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454b1628ff9sm29484535e9.11.2025.07.04.08.40.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jul 2025 08:40:41 -0700 (PDT)
Message-ID: <8202aa15-17ee-4d52-b7f4-50045727010f@linaro.org>
Date: Fri, 4 Jul 2025 17:40:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm/kvm: shorten one overly long line
To: Cornelia Huck <cohuck@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Eric Auger <eric.auger@redhat.com>, Sebastian Ott <sebott@redhat.com>
References: <20250704141927.38963-1-cohuck@redhat.com>
 <20250704141927.38963-6-cohuck@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250704141927.38963-6-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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
X-TUID: Qw/q8/VIjF/p

On 4/7/25 16:19, Cornelia Huck wrote:
> Fixes: 804cfc7eedb7 ("arm/cpu: Store aa64isar0/aa64zfr0 into the idregs arrays")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   target/arm/kvm.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
