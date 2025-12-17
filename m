Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 484CDD66B86
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 18:40:16 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVwQa-0006pC-Vq; Wed, 17 Dec 2025 13:39:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVwQU-0006oX-HA
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 13:39:07 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVwQS-00084O-GY
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 13:39:06 -0500
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-7b6dd81e2d4so6175112b3a.0
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 10:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765996742; x=1766601542; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aLXBZqeM83JX6Q6lKvbnYKIy5amhV1PWF7k/1u72xNA=;
 b=TeDAM00IgF6M/YtB8995olk8SIAY6SFXABKE5IrHsXTHgoI9p7AVxdOwrKlJCMEc08
 gEV7f98T+V80rRex3QFYM4r8P1LIIk3kWFQx6md5bnPs7FXZtO8HPKuhrAb6cxE7JJKC
 rt9S/5xJKDcLQCDVnhMu2KxUSOPlbu63GjQvVe4tcyRxODlwA1N/JFRyCE2o6iyIlxZe
 lEuN+AKXBhBajLsubsBCHbeRF9WhpH/E+ErBD7+5tCENaK8b48UDMxnzRFVvuL2zfqQf
 +u/AkLAwHIR/ulQyqPRkaeXmLwBAYmRrAGm3PUBZdIjx2e5srLoxxBWIXrSQpXbR7E7l
 p1vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765996742; x=1766601542;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aLXBZqeM83JX6Q6lKvbnYKIy5amhV1PWF7k/1u72xNA=;
 b=iwm10XFOrUjRNIDp4ZvJtUwwFsAP21HjORZDM+wCNNx8j8P39idQSyH7BbPSBeFw+h
 CPCMgunxc+4DXg5Wa3a7n+aLzBv9+ZfW0SRlGfuXCslkX0hnHv3POjUXjBTdiGH6oxOI
 YTJ3bwneap/oKAYQMMjPbqggjp0tR8q28Q2XK2PAvNffuu6kAQxU1S4ShuVv44y3y17L
 wWLY02YdnqMR37ggLGPC7Z0TNTBoijeEjdEnit/3nYFccBto131kGPfoRe4TgrTRn8RG
 nLxdLhx5tu8O5j+19kWitRTDEL/V65/kqMp6/Vx60yt1v7jdM5Np+yA9vQ18WioyezrK
 dACQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVaV43WkVhUq0RVlqQEsh9P1CGteqQsRIizWD1s84uXJh8+3HkSHaJe4+zyxq5k9stHJrwHlBqHIw==@nongnu.org
X-Gm-Message-State: AOJu0Yw5tUK0kgFPWnZhx/8ITWEYh3UbDEWpZn/5bIpb/+C8FAyqgKTH
 J3V5drQcsaq+SJg+3dv0JXJtTLp69jDLkFybYPA8nkrTIC5gRKIm+r3Kx65xyMZRGbk=
X-Gm-Gg: AY/fxX412ZnR44eMb0pgvcqdpQEC1b04Rf2SRrgztNCIZaIi1g3jUzAvDJ2q1T0fuhF
 kFdPcpwCB0rGTSF/7164g/4xg4WhPXteid3aLq3X+Emqn5CUx/gnHvBnzc0FA3N1D9UuKAQa/4I
 hWe0SjPt85nh+tRw4FSqQQU6s93a3tDBccS8sigdikASRzAdIe2tjgJpmIj5IoIhmhGoNbQqFGh
 RJHWG5BfVCnt50VoBwgUpMnywymy8og60jHXQTi+8CWs71//pdT8NpdPek53EjaRs23XTnxO29X
 OeYdPOhrROE4r1O4B5ulTQ23CfFIm6S6SQYdaxOCN+k863yLE0EIq3t1L7ZNtBPkkxFyfaxyeti
 6FpxFXyGiCxhsnZ+0xqIIrDrfA/29vfWs04kha0h4dKygiS8hIiHxtKtkMKUBwatX5+wMLjh7TJ
 +EZ9tpsv1XCevfImgrW2IyP+bps7Uiev+ewjHnDVgqu6Z1wL6t+wxOxz3MPogKNMhRag==
X-Google-Smtp-Source: AGHT+IHU6SqWE8cwIJ19HS2nfY6s1wv3lTEm4wtqXTeAJw1kFf+JpHynIF3Wfoeg2anUnXx2cUNZ9Q==
X-Received: by 2002:a05:6a00:bb84:b0:7e8:4433:8fb4 with SMTP id
 d2e1a72fcca58-7f66a07d2d5mr16822380b3a.60.1765996742346; 
 Wed, 17 Dec 2025 10:39:02 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7fe13d851bbsm155588b3a.34.2025.12.17.10.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 10:39:02 -0800 (PST)
Message-ID: <fb91eb8c-be4f-40fe-8376-e7a2c43ee578@linaro.org>
Date: Wed, 17 Dec 2025 10:39:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] target/sparc: Update MMU page table using stl_phys()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Anton Johansson <anjo@rev.ng>, qemu-arm@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@kernel.org>, Peter Xu <peterx@redhat.com>
References: <20251217143150.94463-1-philmd@linaro.org>
 <20251217143150.94463-3-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251217143150.94463-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 12/17/25 6:31 AM, Philippe Mathieu-Daudé wrote:
> stl_phys_notdirty() is supposed to do an optimized CODE
> path store. Here we update the page table via the DATA
> path, so can use the normal stl_phys() helper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/sparc/mmu_helper.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


