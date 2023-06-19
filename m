Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2816389ejt;
        Mon, 19 Jun 2023 06:40:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7LOXThSONF4LICNqvJ/vVPwjYHLD1N//ZMVwXTgq3dIR69paMFpPlQps8KVt/xHMFOvDrb
X-Received: by 2002:a05:620a:808:b0:762:404e:5ba7 with SMTP id s8-20020a05620a080800b00762404e5ba7mr6593399qks.3.1687182009524;
        Mon, 19 Jun 2023 06:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687182009; cv=none;
        d=google.com; s=arc-20160816;
        b=Khp7bziJpUONWIWLK8+JxYf4WrEcrq2O2mqXT9cjc7YBFzrC3LNTuaFy73Pwak+vTW
         ui+mLZMW6JbvPCvc5mz4Xr7PXhIET+vfdku2CuLWsBwC5w30vXdCWJYKUJHQuMYFoXmx
         yI8NDemFWzO901pFQFfsxJkcrJyEtcCSR79Z8tFnduHNshhLSkFSqSmoSS6YK/v+QDeT
         /4bYub4u+M/99Y/nwEmaxK16qmdyJSNPFLs5Wm+UooMm+FC0AJwIsgQW6LQuTBP9Z6zO
         T7C5CaOep8RO8NFeMqhypwxpc5nfF6D45lusMiNUQ46yv2Q8KQ17eoIRWMVJkWymRprx
         /eQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:organization:from:references:cc:to:content-language
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=WHg6Kxw9oXcCg7qjcrpufZ3GjlvbaQFLwe7ZCIiP6Gc=;
        b=SLWmdkITqVPJKRvV6aDuDSGii9ahLnk/ksAiMoZKe3LzpvMciOdQLoyyeyveZenPy+
         WOqKdf9GUvZc/MV62V4eEo1l9BG7GrM5eOAjxLEZr9GiybfhG47hOJai+B3tgn7sVbik
         DPo6SZoRhU9ChtNsyAOEv0JrTAxrEmk3QqzJ6xILvsghhgQyyGc2+7zPuRLzEnYJ5Tap
         ci1b2ziAcymu3GQ7Pr5o9UIgMZzi/1pRkWqG28BKC7clZlEpiKz8+px5MuquKI3MYa7A
         gyWM3QDSMGuRNZnfQmRQNx4cYYGnhBGpHz079jAat9kVTM31W4K3iGTuknz4malpgFQ8
         72uA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ox14YewV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dc5-20020a05620a520500b0074fc53cbdfcsi1317372qkb.667.2023.06.19.06.40.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 06:40:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ox14YewV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBEMz-0005Er-N8; Mon, 19 Jun 2023 08:52:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qBEMy-0005EL-3o
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 08:52:32 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1qBEMw-00061T-JL
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 08:52:31 -0400
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9786fc23505so413930566b.2
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 05:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687179148; x=1689771148;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=WHg6Kxw9oXcCg7qjcrpufZ3GjlvbaQFLwe7ZCIiP6Gc=;
 b=ox14YewVLqPkvwugigYhgQ9ioo7sOjwLh1ImBtb8eNdtxX4wexavEhru7gTzcry+t1
 tX2Nkk0iLAhNAQqh3ElUK9CNiXSUaOtbyTd87iddPGB7zB/G3cIeAOw+C9r3PJcIR++6
 A9ORHe3/J+YT9jDso1RU5qNolLDHi+/wawSjlkIAVX7VYP8JJZZxGJ56/BT/WqZd1+PC
 HkV6En/LwUmyqp2y2J9ZyyEsGvPBvZF+7gwesBP3w17K9iEeZChK0x4myq6IoCu1sI1u
 ljeMnVQCXSskjt4UzY8OmoRO4Nif+CIOc7WIG23SN7izUatd7lx/MIcediupVDBJ8npj
 dfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687179148; x=1689771148;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WHg6Kxw9oXcCg7qjcrpufZ3GjlvbaQFLwe7ZCIiP6Gc=;
 b=FywHl0CmNjaXKblxrNEugr/qMFrKxRj/dupcVcgfSwYb1vvzW7yvTXabxoIeQ+niPx
 6MAZ5inoOSg+RxWV5GiPO2m2dIVujtgX2455yyxrHV3hB7r3Tet4HHA2EFcjNuuGuvk+
 VZa36iQFOI6qdgngzYLxBeu1fGf1tS1sq2MOtd0tSM8WQjIbr5lPd10WpNIlPStLDIN5
 MtHE6Tfjf7b3Aj1iRqQqFlacYMv81xM5YP5w85hJOO1+PQC56OhXRExb+580uPMcvSWi
 PTGln9bPXzl+M/sycknP/iIGTDqYo7NB6bA7i6BrXECv4zUvknXh48ltKfWEyH6uutWi
 LSuw==
X-Gm-Message-State: AC+VfDwbvK+6+W70+qs2H3/yxoKf/p2/7V+6gieePtQPozp7lS1fjqzx
 xv7kRpn8OrVVL/h3YyYJD1e1gHVVO/kCyMUwHzjW6Q==
X-Received: by 2002:a17:907:94c1:b0:982:7d5f:f608 with SMTP id
 dn1-20020a17090794c100b009827d5ff608mr8168803ejc.46.1687179148621; 
 Mon, 19 Jun 2023 05:52:28 -0700 (PDT)
Received: from [192.168.200.206] (83.11.39.176.ipv4.supernova.orange.pl.
 [83.11.39.176]) by smtp.gmail.com with ESMTPSA id
 pv19-20020a170907209300b00988ac5482c3sm1403585ejb.69.2023.06.19.05.52.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Jun 2023 05:52:28 -0700 (PDT)
Message-ID: <25d9a1e1-7e02-5cc2-ba14-83c47c93a514@linaro.org>
Date: Mon, 19 Jun 2023 14:52:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 1/1] docs: sbsa: document board to firmware interface
Content-Language: pl-PL, en-GB, en-HK
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 Radoslaw Biernacki <rad@semihalf.com>
References: <20230531171834.236569-1-marcin.juszkiewicz@linaro.org>
 <CAFEAcA9dA_Siv5aKbF8Fj6nqm5KsuzU=qjEgiFC2KR6AhyaoDg@mail.gmail.com>
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <CAFEAcA9dA_Siv5aKbF8Fj6nqm5KsuzU=qjEgiFC2KR6AhyaoDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-ej1-x634.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 3uKZKB0cdBol

W dniu 19.06.2023 o 14:41, Peter Maydell pisze:
> I'm going to apply this to target-arm.next with this squashed in
> to fix a few grammar/format nits and add some text from the comment
> in the source file about the platform version part.

Thanks.

My English grammar sucks so I am glad that you looked and improved that 
text.
