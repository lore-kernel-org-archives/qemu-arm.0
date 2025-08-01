Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64BAC87FCB
	for <qemu-arm@archiver.kernel.org>; Fri,  1 Aug 2025 20:53:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uhwii-0006zI-6H; Fri, 01 Aug 2025 16:51:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhveg-0007xv-RL
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 15:43:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1uhvee-0003Vb-WC
 for qemu-arm@nongnu.org; Fri, 01 Aug 2025 15:43:02 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-320dfa8cfa3so1842527a91.3
 for <qemu-arm@nongnu.org>; Fri, 01 Aug 2025 12:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754077378; x=1754682178; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=m1GzHJVzvXUVPGDotiMouF8v4IRAjdbu+6sEQhGrmUY=;
 b=flwGdOhm5n1zWaqmi0Nrk08qCQCOnbZtRVQVXHTd9BoJXpSnfzew0kbxsrNTCfXNy1
 X3/3/C8z1I+hH29dfseDkQFfoZRggFJvK6JGFcMEODj5NXwhJpbTV9NTJnV1yNbTE5aJ
 TMdxQ6B0NBx6+gyGr/JGSSdMvD2ZE6GUz9nV87+45TIoayEiYLNezooN1G/kSKrPfetn
 hQjThbY98wHxNNpWGQUaeuM+KQlXoJsYdB8LLR6bted8uMTGDMc8yXcK1TwmhJou4rvq
 U6mmdguU/cqmKC3lcaxyrDxlSHWYMpf4V6iOrPG3XG8CjyQi592VX/9gOwZZbBREqOvL
 DBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754077378; x=1754682178;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=m1GzHJVzvXUVPGDotiMouF8v4IRAjdbu+6sEQhGrmUY=;
 b=V4hTOkVx09EumlxT+j9k/CYTANIg7nj1cZsO4jZFAQ/W/7FF6SXGjL9kR0ZsJn2L3V
 PHEZCLnI9sBXNTf+kZ6BOxIJZtogs/xkwYN1bUZCdZ5a/N2vJFFuvi5TQuimAxKI+fs0
 1q0mvn3jOkpMRexVpUaQOnvJ986qjXxoh3hDDSiXjitASE3FFRBDN4oEah0kd/HwehTN
 2mtfQDwf3wpGq89tChh5bODPIjYu900QtSeOQVrAw3T8ascxFnfoYFgR/MD6pVjXe0cA
 8RvL2l7nsYDVGb2XiNHC+5sbb2VQeELB8qpQPmtr+g8WFxUvpkNZrD/dwUvrQEjScLFs
 +Sag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd68mz7jrBzRD6k/+MXnll3GMw2KBGC6jEGb9+ICzwILSbDl3uBZco8g4WApQ4bh2hQ3O6OJdeKw==@nongnu.org
X-Gm-Message-State: AOJu0YxqAqdfv11o2WXwunxDOeVHs3eAAvCCUQLiagQOO8qQN7agHySj
 CTVXqTNOW7aED8Oll+X5T74AW1A+1Onxm/2RIQi1gWHzPOoUs6aVU8rS1jlRvkkN65Y=
X-Gm-Gg: ASbGncvsSvw2twoWN79h3Rm7VRHcy1oU+rKSNa7AxCFADWGBaeQivXncnBHiFblvWLG
 CqUy1+3TBsXaiMB4aQGWGqm9kCnC4pK8pxZVcroE2x/bS8D15Y2ah4IvVWiwL4vTj3huJ84u9nU
 e/UJtgERIm11aQcICC9x6QoD08wLjiwDw2mArm2vPrtBxT5uJPYvmAWBGEOCaT29yZ00qVH4eqx
 wJEyeRKNrijR6E3w8zTeEM0cxJQHgpknpm6UuxAixMUKgipKHsjfXhqv/famIgCkmTqD50bgyqu
 nP+aDA24FJ0vmYaz1D/dx0fLNwPWrfx/FmFFEgjbfynsmlnusQveqxxEVvrOZhg6QrplI1VxFKZ
 9bfdC8su+Djb5QG1weGnRr7zgEoGpP8WBxApBHnKH2RDP7g==
X-Google-Smtp-Source: AGHT+IFUI9d+0UqBMgY+QfDhUuShoGJdcaNmuEl3nahB6UcgRGYUAHJZXBL1JJKAb3DaSkXEtreezw==
X-Received: by 2002:a17:90b:1b4f:b0:31f:30a6:56ff with SMTP id
 98e67ed59e1d1-321162a204fmr1264550a91.19.1754077377902; 
 Fri, 01 Aug 2025 12:42:57 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3207eca6eb1sm5412904a91.22.2025.08.01.12.42.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Aug 2025 12:42:57 -0700 (PDT)
Message-ID: <b613245f-dfba-4f9b-8914-7c1e73c9dba5@linaro.org>
Date: Fri, 1 Aug 2025 12:42:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/9] WHPX support for Arm
Content-Language: en-US
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20250731052753.93255-1-mohamed@unpredictable.fr>
 <8af5e691-da19-4141-8874-51ca685288ac@linaro.org>
 <864AC97D-2C45-402A-92AF-D0FDDB72C40E@unpredictable.fr>
 <21266cf2-887d-4bf3-8c9a-7633bffd8cd2@linaro.org>
 <17413DE3-C53B-4DA6-9777-3E772D2C2C2D@unpredictable.fr>
 <d495bae3-d252-4b79-883a-3f5f815c5feb@linaro.org>
 <5A71E199-4C6E-467D-9E9B-04DE9EF1A9CC@unpredictable.fr>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <5A71E199-4C6E-467D-9E9B-04DE9EF1A9CC@unpredictable.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pj1-x102d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 8/1/25 12:31 PM, Mohamed Mediouni wrote:
>>> I didn’t test anything on the stable branch for now but only on Canary so far.
>>> Just cursorily tested (EDK2 only) an X Elite device on prod (26100.4652) and this issue doesn’t appear.
>>> I have 8cx Gen 3 and 8cx Gen 1 (SQ1) devices around, will test on those older SoCs later and see.
>>> Random idea for testing: what if you put -M highmem=off, does that change anything?
>>>
>>
>> Good guess, it solves the problem with edk2, and direct boots linux kernel successfully now.
>>
> 
> If you don’t mind, could you please test the latest commit I just put on the Git repo (whpx branch)? It should address this properly.
> 

Sure.
Without highmem=off, I get a new error:
Physical address width: 36
C:\msys64\home\tcwg\qemu\build\qemu-system-aarch64.exe: VCPU supports 
less PA bits (36) than requested by the memory map (40)


