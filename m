Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F69FD66B86
	for <qemu-arm@archiver.kernel.org>; Wed, 17 Dec 2025 18:40:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vVwRN-0007lZ-G6; Wed, 17 Dec 2025 13:40:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVwRL-0007bR-Oa
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 13:39:59 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pierrick.bouvier@linaro.org>)
 id 1vVwRG-0008Jn-Vn
 for qemu-arm@nongnu.org; Wed, 17 Dec 2025 13:39:56 -0500
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-29f0f875bc5so81014755ad.3
 for <qemu-arm@nongnu.org>; Wed, 17 Dec 2025 10:39:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1765996793; x=1766601593; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wwcBF4a8auq3KN58gShoxiES+zJFZ1fbyeMiF8lST1w=;
 b=PTGjrq9K3+QUoL/YQWUZvySGgbnfT95REwjHkw0GOt3W38dSEQw/QGgXAUTIhIOpyc
 ctMQq3/dF/zi2djFZCL76RDhdB6K49jOwn16sJKu3RgljCg66sJ14ioemsbSljRk5m3R
 tOMgpXsk9+ULlYOER2ZbV9BJF59gUcPHyor4VCjix7gS0sNth96ym5v/gHm/PTMPqt1A
 t66HijGiK1PYFxZlDbw6cmeKnzB1N/Th6tyThI8C/EYsiXyIc95bp5jtaGY9vX5stj8N
 3iby8/svjb2vm8UyL4R2ZsPxQ4dlzmgWO9+ItDK3MNkE+GrOL/YZPdj4v5RxXRqgQ8VF
 RH+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765996793; x=1766601593;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wwcBF4a8auq3KN58gShoxiES+zJFZ1fbyeMiF8lST1w=;
 b=eCQt7VuyU424a4IdVjsHGhKxM//dIB8GiWVqS0KWlWJJ+K6Oznb4r+kjdpt78hs88A
 sBA1PREbD9Tdq+H6z0GoXQnevgBPZtdfoQSpkDxUndlRPXZ5v5W+pgq8uVC4naqv2Fho
 jTCvyVV/IuIfahzW7irVUPSGitby+cQkI4Yqu8KAQc3Ru1i5sMWtfNAfyoNitbOsNiiD
 ob0KSf/pIqtZsWcjw09tiJjX8SHvs8LGSTIDyrJFP4HD6FD6uPR9lBG0veqR8UzOImMp
 LDUPE0AW2Z7Mp//Vzmg/3g2N5Zh3Iu9ECGpANMsaBQEmPSYpVGZ0UYNpsuXoJ1HBlMwj
 CRGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX//+JG6ONbBqgA8J0rmPjw8SoknQEL6e9kUBJ19QrMYx+fPgkadQE5bQG9/RR5t27/x1dQ5D5r3Q==@nongnu.org
X-Gm-Message-State: AOJu0YyTgYvHqSSNvA8bQ6h4WfOAFrQ2iDlQN2O0KHbNX7PlydbNZolU
 45gbLhtfbIaXVLHBUjUWoNu/jiWlRA3T45vY4CgX8ok/Ccph7djmm32njiYntoU1WCc6vU1Ae9R
 /24vsXPc=
X-Gm-Gg: AY/fxX6JRxBdwr/MM3SdzUYQVPN1VCZvirPWxPO0ejz3X24YLtg/fxFZ/zvdzRAsKZ+
 A/bH9AGITIJzlSVMwJEVh9TYxLNOJx+O9zbL33BE3ckFlO/sHp3vgyiAOEWSl0Xi7FIDQJ3EElF
 8DmPM3pukCgVs8DKjzqbXMi2v9NctuS24WE9gbtZWYY5Bj6MEQnc4ovpJONBvrfsGGmfLvCEqc/
 sf/Wk74V5S2VoFaUAbPo6XykTJx/7IPc4jC+5hu+oev+8LXc3rHprFDWgfm6i3a71Og/PzT7oK0
 j+gOaA+NmX46GTObR7UQC9j8I3pCCYaEFNhd1Q3s4Zxse2hBM0EKCUMNV2t6f7fYLve9UTFVv3U
 Yl0WnFtKVg8AsKRgnJEK4qTxrCi38UZbsk0Jbfe0vhI2Qar19u+j7yXE197V6AzmRCZ/p1uML3s
 cqmihbN8HCUpKyn7cmG1sYvcBnUN2c2I7+XVgwwhhie5ukJ5ttIE/1XJoK4Di+JE2PtA==
X-Google-Smtp-Source: AGHT+IE7cNMOMTLLH5UltTMHOmD/hQQJuUrpNuWs7hgkA9stEeViOSSa1WAehWXLK6heezLRg5+C8g==
X-Received: by 2002:a17:902:db08:b0:2a0:f0e5:9468 with SMTP id
 d9443c01a7336-2a0f0e597c9mr109720845ad.32.1765996793391; 
 Wed, 17 Dec 2025 10:39:53 -0800 (PST)
Received: from [192.168.1.87] (216-71-219-44.dyn.novuscom.net. [216.71.219.44])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2d19269f0sm224795ad.79.2025.12.17.10.39.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 17 Dec 2025 10:39:53 -0800 (PST)
Message-ID: <09edc52d-2027-41db-a981-c622ba30f5c1@linaro.org>
Date: Wed, 17 Dec 2025 10:39:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/14] system/memory: Remove address_space_stl_notdirty
 and stl_phys_notdirty
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
 <20251217143150.94463-5-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20251217143150.94463-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=pierrick.bouvier@linaro.org; helo=mail-pl1-x62e.google.com
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

On 12/17/25 6:31 AM, Philippe Mathieu-Daudé wrote:
> stl_phys_notdirty() was added in commit 8df1cd076cc ("physical memory
> access functions") as a (premature?) optimisation for the CODE path.
> Meanwhile 20 years passed, we might never have understood / used it
> properly; the code evolved and now the recommended way to access the
> CODE path is via the cpu_ld/st_mmu*() API.
> 
> Remove both address_space_stl_notdirty() and stl_phys_notdirty()
> leftovers.
> 
> Suggested-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/memory.h        |  6 ------
>   include/exec/memory_ldst.h.inc |  2 --
>   system/memory_ldst.c.inc       | 39 ----------------------------------
>   3 files changed, 47 deletions(-)
Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


