Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2133822ejb;
        Tue, 30 May 2023 05:22:35 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ54XbrL6fLsSHrLJEu4pDWG7MGDTwjJ86QiSzpoei+EV+TRMOhRUUTlh0Iu5nyrYLxP5Qn2
X-Received: by 2002:a05:6214:2526:b0:61e:f999:5394 with SMTP id gg6-20020a056214252600b0061ef9995394mr2353283qvb.0.1685449354810;
        Tue, 30 May 2023 05:22:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685449354; cv=none;
        d=google.com; s=arc-20160816;
        b=eG1fTxFMQmsMl9iAC8UJz/Y2gSBnnSTuga37MCuMw8AWmXoT+Gxym1uLoWqHRIQ/3Z
         qaHFN55mDueXnMYoSmenepGCRj1gQOl7+7ulIKF3BLIMtL6Lx0A3Lfl40UZzKCzJR5Li
         v9cQdli4fsruSD4dbj2Vi3OLzHaHnNB1eIMWNzeaNqgPPw9c4f36IfofvBqWFBx4STm1
         mZ/9sLur1dFERz0Joj/CqAgm6MIu3rWqmSSC2wWVaSCk9W/58f4JY71V9SDKKPdFTsba
         6lYxxCZ6lN1qwyTC4qWRaws89EEMFFiGR9yBfzmx1A3xBbcthX5zNwnx2IqXj7ctqvrD
         opWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/iwjt5UzZyS/5OOqSTr1TjEPUXgE61Zu31mA7m8RfYY=;
        b=PQGG4b3dPuZb3APtw3AuLnVeI0/PaOEm57GQp04wQByPGmYIb3DQvUrJMmrGIMZNtF
         566P5y19iRfLKMD3tP768hfwaGjJZiABfg1zasvXl7FJsLu8sv5lxscgy7b0O9yAsID1
         hD2ogZqC/+h8lH5jyVtQ3yNdC2kKxUZrerdCdZxZPJJRrhwNlz0lI+kobAoTEQ1lXJUb
         Rw/91adQ0XncsomZ3KaGd6+WS2pP8UR5YaxC97cxiONqvtDq3AXdHRvoFH9A5PNCI6R+
         EWhZRIlRHGBy5OF3/EX/ptd0pHLv+tLjReKcDsCIz/uir2Jja8jE4s7t/4jjEgCQA57y
         wT5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iUdlziyC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jl14-20020ad45e8e000000b0061ada7f42dfsi6629441qvb.182.2023.05.30.05.22.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 May 2023 05:22:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iUdlziyC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q3yMj-0002eh-SN; Tue, 30 May 2023 08:22:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yMM-0002Ey-TI
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:21:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1q3yML-0007fv-Ds
 for qemu-arm@nongnu.org; Tue, 30 May 2023 08:21:54 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f6094cb2d2so45853995e9.2
 for <qemu-arm@nongnu.org>; Tue, 30 May 2023 05:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685449311; x=1688041311;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/iwjt5UzZyS/5OOqSTr1TjEPUXgE61Zu31mA7m8RfYY=;
 b=iUdlziyCl4CBxT3sO6ElqxsIzo4/ZCpzB4LtA3fIZQrsvfFVfrjzC2nvHCqzWV5089
 yuC8pnDenxEoHHDSekmN7RhvnVqR/+pxTo1aSBiDLul7hVdpGtfK8UN0aeqs2AaFcXjU
 aVFaBeFEU0BVXLo5fwnzoEbOnW1RVSK0gQp3Nt253R8ffr1Tg5T6WjzltAnMAMifRImP
 tFAI9j9o7qdrkPQluRppf0e3H7eIj2FJT4igIkMLSlUdHtPNlCsEtkCh6XSgZn1xJ/W0
 /U2+4AuAVaodLGyFWgtcbjRYtJXOfNSsrFBJ0zec+Oeq5ZEGw0aMr+N4oHtc2/FksvuI
 T+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685449311; x=1688041311;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/iwjt5UzZyS/5OOqSTr1TjEPUXgE61Zu31mA7m8RfYY=;
 b=NjL2c9j53AizQ0LOqcZdBzGZVKLkGLNjBQGjC66/Qve+XPdKmnWebec2FDWk2eKSEl
 PDF8obrhKFqJXC3NGawoKkKRBteTaHCpqV2mXgrVlPb44egfKqH38/NqgHOXERMyxbma
 soPNd6298XGfSSbH+ZpZxVEWexIzK3x3U+Tez94WP3DlWgyBd/QIixLI4XJ3OqDHac3C
 YWkGQ93m/6jdAWCS44LuwkrPExKZu8eRQ4MvMfeveEUfTjJSP/SfdMZSZDOaxXf0Tsgo
 ONE+XW9nlD5tuItn+a4Hwd9gEJYjv+362CJDuBf3EtYzW8TTkn4hzfrCwZPTDfwLgR5L
 CTHA==
X-Gm-Message-State: AC+VfDwUi+PE9D/3OKj4HW6PyKKf7i9ohzN3GIosTJfBD9kNJQjTuvs+
 76si0mTePncQ0KauRf0OE4hWig==
X-Received: by 2002:a1c:7516:0:b0:3f7:5d:4a0b with SMTP id
 o22-20020a1c7516000000b003f7005d4a0bmr1612494wmc.1.1685449310939; 
 Tue, 30 May 2023 05:21:50 -0700 (PDT)
Received: from [192.168.69.115] ([176.176.180.1])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a5d6e8e000000b003068f5cca8csm3081140wrz.94.2023.05.30.05.21.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 May 2023 05:21:50 -0700 (PDT)
Message-ID: <78c33a17-c3a7-134c-c2f2-0f4a46e38768@linaro.org>
Date: Tue, 30 May 2023 14:21:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH 07/10] hw/i386/acpi-build: Rely on machine->device_memory
 when building SRAT
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Eduardo Habkost <eduardo@habkost.net>, Greg Kurz <groug@kaod.org>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>
References: <20230530113838.257755-1-david@redhat.com>
 <20230530113838.257755-8-david@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230530113838.257755-8-david@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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
X-TUID: +aE89n6bOWK8

On 30/5/23 13:38, David Hildenbrand wrote:
> We're already looking at machine->device_memory when calling
> build_srat_memory(), so let's simply avoid going via
> PC_MACHINE_DEVMEM_REGION_SIZE to get the size and rely on
> machine->device_memory directly.
> 
> Once machine->device_memory is set, we know that the size > 0. The code now
> looks much more similar the hw/arm/virt-acpi-build.c variant.
> 
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>   hw/i386/acpi-build.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

