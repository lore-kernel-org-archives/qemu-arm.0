Received: by 2002:a17:907:60c:b0:a6f:8e2c:4d9d with SMTP id wp12csp2046621ejb;
        Thu, 20 Jun 2024 08:36:39 -0700 (PDT)
X-Received: by 2002:a05:6512:3995:b0:52c:8b72:3cdd with SMTP id 2adb3069b0e04-52ccaa9190fmr4196849e87.47.1718897797117;
        Thu, 20 Jun 2024 08:36:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1718897797; cv=none;
        d=google.com; s=arc-20160816;
        b=jsaA1YC81byFG4CvwTHrGYjoQaquJjZT7NGD+khavn5rn2GApii8yjBTglkobTsgw5
         L8Y19LpuIyQXLSeFRKABkVfllDZFqP1TBonrzkzLbHCiULv8b+Fg6IleY3mNsuawW9tL
         0LKTdkH4ouFOudgvFnzL8K0LO3W0fZCgRu6nkoLl6cKbPjgnti2POhKyYrU4e/ge0zka
         tsvxCCWb+2Q6iCDvNkhkyaFOsh0Qed37QhICDSjjpPz3lfsIrMMmi62E3c8Igr9c1ay8
         mLM4sLgnANGo1PTQUrkLUD0weqKfhaePp7MKU3KgyYRHM277XnVY451VEFnBXpa2z6vt
         bIig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=kBelHbT28/Diop473YxP3LQrHyerXnAYSm6Ciyy6cC8=;
        fh=HXa8J5q4h1VU/RM0divyBT2bY6pQ6DGZA5b+g8T361w=;
        b=YaQLRvaRUeimih0qKWFm+zqvcJIWwt4X+2hV4xD7bhVyq7aIML2HGgfP//tHFtkCCg
         EvnK8WcEu+QEBpSMOpnJOaCBTbeM4t6Kx4gjMhMgp0nB07xx16jddo05CZqynWpO8bwB
         /+KBgb8uW4sCGoIB3vOfuxbjlIC3166KUOxt3uQ9aSVxV/xGTwlqaHu2jJ5KxDbIJo/e
         IpIUBoetMSfATl562ozFulVwSP0dJKiprg7qH1IQFqVw4Q9E1DBETrwU9jdwuPIbTbc/
         +HCuxGyHTarqomKMjDaVw0MLyrnL/2PaDmi/BBLeds2GXQcZHzbbt6oESFFuZw11hd07
         Yf7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ni2Nmqt4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3632ac11d8asor1310645f8f.8.2024.06.20.08.36.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Jun 2024 08:36:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ni2Nmqt4;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718897796; x=1719502596; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kBelHbT28/Diop473YxP3LQrHyerXnAYSm6Ciyy6cC8=;
        b=ni2Nmqt4TuTw+16K63AXHjEEiPpsPvo7jR5NmVCgbjYs64O8fFLOzPKxmVbVc/3k7V
         riyO6sYyhlDJrVCaO/UTO+pMi7Zuw/oefWFEMJfurRRDVAC3inf/SfzrWNvOBvHqtjKk
         pdefRVt2x+R+Oia0wvC3aZFLrp68GGAeXBvUgBz9JxGexaz4TsyEW1QpylkO0fuZD2fs
         tPJCrkQJSKg3xRl7HLsWphjENdd0Yu3Z8aBe9L/EVk5WD/JRcM3qdVLEOkMkNJ2JwzXi
         6aFtOTASZktUsUoZ/cjbBf9RyCe37SVdaWr8akg41stMJumV4RyifFg2aItfVYHWXLZ0
         +BmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718897796; x=1719502596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBelHbT28/Diop473YxP3LQrHyerXnAYSm6Ciyy6cC8=;
        b=tqVV16alNNWEWiKdgX6Jpga1bLodMQfD/4SGQHjphGC5jVG4qAQNmft5d/SSpAL8zm
         oPfLy1uoNNzrN559UVoDw3hYe2O+HLUE1ORqT0UOS5IfoZ/dODwetpeuMEpkEcnloh8f
         GTC5YhUrx0Bju8cIaf9SIQn9+36a+hqdaCnGLCPKHvo7d/L9EvwCIt5c7pXw/sUZuirV
         6Zaemcnn8bmqiHmMIJv81R2r2jbhAFBPz9cLS0tMOsbtim+Pv183zzn3FC6wz6rZ3fpv
         XzwBGJMbcJfFsV2rmeSPlPydxvryCvwnv1J06GltS2KyjJW1v2iysBbBUCiFqeix5vMP
         Q1eQ==
X-Gm-Message-State: AOJu0YxE8TndN6TcMu5vvTegzmzBavyKxuidc7EOUzabZ3Olp/siLLYw
	1k17UeZzmNOvMJ0ChseJdmAIhqSp5tmlz4NOdapHjlAKoTIsuumfsArLREvlxH3Qm0/MpsOmdxh
	+2KY=
X-Google-Smtp-Source: AGHT+IESuhZFJcdm5hes+a066GEweTu8SnfStPf1hkxE4lrjoWZg84KFkN5dQa5LfuOSsL3U9/ThLA==
X-Received: by 2002:adf:edd1:0:b0:35f:b03:bf45 with SMTP id ffacd0b85a97d-363175b92f4mr4438519f8f.24.1718897796372;
        Thu, 20 Jun 2024 08:36:36 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.100] ([176.176.151.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-365a20d9b13sm551183f8f.85.2024.06.20.08.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 08:36:35 -0700 (PDT)
Message-ID: <37f2ce0f-b4a8-44dc-bc94-e706eeab6663@linaro.org>
Date: Thu, 20 Jun 2024 17:36:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/12] accel/tcg: Avoid unnecessary call overhead from
 qemu_plugin_vcpu_mem_cb
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm@vger.kernel.org,
 qemu-ppc@nongnu.org, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jamie Iles <quic_jiles@quicinc.com>,
 David Hildenbrand <david@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>,
 Mark Burton <mburton@qti.qualcomm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marco Liebel <mliebel@qti.qualcomm.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>, qemu-s390x@nongnu.org,
 Cameron Esfahani <dirty@apple.com>, Alexandre Iooss <erdnaxe@crans.org>,
 Nicholas Piggin <npiggin@gmail.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 "Dr. David Alan Gilbert" <dave@treblig.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Max Chou <max.chou@sifive.com>,
 Frank Chang <frank.chang@sifive.com>
References: <20240620152220.2192768-1-alex.bennee@linaro.org>
 <20240620152220.2192768-13-alex.bennee@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240620152220.2192768-13-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2E4Fhwq0OJLH

On 20/6/24 17:22, Alex Bennée wrote:
> From: Max Chou <max.chou@sifive.com>
> 
> If there are not any QEMU plugin memory callback functions, checking
> before calling the qemu_plugin_vcpu_mem_cb function can reduce the
> function call overhead.
> 
> Signed-off-by: Max Chou <max.chou@sifive.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Frank Chang <frank.chang@sifive.com>
> Message-Id: <20240613175122.1299212-2-max.chou@sifive.com>
> ---
>   accel/tcg/ldst_common.c.inc | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
