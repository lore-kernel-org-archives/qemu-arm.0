Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp4625404lfc;
        Thu, 14 Oct 2021 17:44:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzmODbaobIoxowTkQOcQaKdj58e+jcsit8L0GaEWsr78Ksel/g2JJUfkSFDYdptNj+nmM+o
X-Received: by 2002:ac8:57d4:: with SMTP id w20mr10306329qta.261.1634258642321;
        Thu, 14 Oct 2021 17:44:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634258642; cv=none;
        d=google.com; s=arc-20160816;
        b=cjj/+T+nusqLjzEmjm0eLyhwSmXXaP4fgkwdPcmFEu6U/e0OHVPMEp6/O+mO1MMtzY
         vS2GCpqEx0msrI1n+5siFxo9mv95YM/ENQNm5qfY8TUttUuug/maWhycOfkqhtaMSEBn
         t6Ul99izdjua7YGkWzzYxAeciFV9OlgBVNpQSEzo/rZSF9RTPQer/2W6X83cbi0w9EYj
         HZiOgsXXdFKX8qvclDnhs9ibzxvA3s6VZogM3XWgfSFGmjW3syeITVxiBTGSeRiAlWbp
         oqHauuNCJS7xj5aLXoizCySza8QhIkrHP38KgxIXNNeCpzoQE/egQVAekMiP37amw1BT
         d5qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=l5VR69niRqnB7hRqEbp2wbyAfEMMUJLa4DLI1jrEWKQ=;
        b=vjWcYdL47oaKDlVQ3aYayv8I7uYC/QPDjaPwxN3PJUABajdhoMUSFn7Vd09syMHxAa
         hVlPg3kCxTwZqLZu/+Dp9KkAxetUseM6ibXDs1AEpCrt304OE0zp24wGmAGWG1Un1VKQ
         eON0lz5rGT2TxgJhbXXwKd1ao7LZyrM2BeZacRR2k2/HFJ4uTGveG1Wxukzg2la5fMvX
         lY2YlmyYecGTloLJMun+aDEnajIsZab42Kl6MIPfd0RYsXsr1gH3ek2u7bM6SoUMNvmF
         bErr3jsiWpwU7/5eKM8O5GMUni8lSwSkDqy4+Riui7dREDGYAKjwb1iRIAUE/I86gCUO
         W5Wg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5HMIjj8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gv6si4051760qvb.79.2021.10.14.17.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 17:44:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y5HMIjj8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mbBKL-0006x9-QV
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 20:44:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbBK7-0006wb-1n
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 20:43:47 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:47037)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbBK1-0002JI-5w
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 20:43:46 -0400
Received: by mail-pl1-x630.google.com with SMTP id 21so5292780plo.13
 for <qemu-arm@nongnu.org>; Thu, 14 Oct 2021 17:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l5VR69niRqnB7hRqEbp2wbyAfEMMUJLa4DLI1jrEWKQ=;
 b=y5HMIjj8hyMBCnbxw0yvMZyOccfwdt7pHX71roiNd2tmjeee2WSCVn1JzfN7Zp5iap
 xnYaItnqhepop6dtjRlQTFZg5xvha2eJ4K/7p/tP9b92cTBlhy3aPX2fxxV0hSTqA40h
 H65dlhbOdLehFJyAC2OlaTFolmxesFCujD31e2T2WLZM0Yhh0mr7zfw7WYz87YOg6lbF
 8aPV/saSk5FNlPa1IgfZy+OmIvwpqS803nJouzZmtWnsA79QyhspmSo4XxBhmvXkzPFi
 NykIiyPkVfgOKaWzPM79k4SzbFVz/VM3+ygPikHXrTrw+OHlqzWu3OXpVXwnjhbnGrTI
 gtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l5VR69niRqnB7hRqEbp2wbyAfEMMUJLa4DLI1jrEWKQ=;
 b=vmttH6cgnvUwMo082ssGuT65ITBfwD7+/FIsW/Hy0pMCGuDwrUgme9z+Sz9Jn1ebCX
 xliObMQ0Vj7dLsEr2ivCmYXk4FEXuE8aJ2n1R5XfHHi28foFJNNEEuGqyZViOq3g0X7F
 JiKkVVthLAcSDbxwnahr3EkS74i5dHuaH3gunzC84/7XTddok9XXBbbP5C4bVluVmY+k
 DD4vmXiuWB4JVw0FqU7z1+Wik3u494OXcE9+BFm3kuDHQJkYJw/WfQwiZuWZaALYNrV+
 cDtDFbMu3pvnU44Zzpc9FgL7VMC8r3nWPWV5xIy5sGozl5zrX1sXExQwO/SVpRViX/ci
 c6Ww==
X-Gm-Message-State: AOAM531TFjDx7jFoKofWgiD3cwvFQ2Rf1cYJn7EsbwkAZwVljgPYXZg5
 BYqHi4eY8b0v38arhYZOvm9iZg==
X-Received: by 2002:a17:902:9b88:b0:13e:55b1:2939 with SMTP id
 y8-20020a1709029b8800b0013e55b12939mr8084943plp.80.1634258619582; 
 Thu, 14 Oct 2021 17:43:39 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id j6sm3339974pgq.0.2021.10.14.17.43.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 17:43:39 -0700 (PDT)
Subject: Re: [PATCH v3 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table up
 to revision E.b
To: "Michael S. Tsirkin" <mst@redhat.com>, Eric Auger <eric.auger@redhat.com>
References: <20211014115643.756977-1-eric.auger@redhat.com>
 <20211014080436-mutt-send-email-mst@kernel.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f8cf6f07-adf7-63c5-bc92-486f9274acf0@linaro.org>
Date: Thu, 14 Oct 2021 17:43:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211014080436-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 jean-philippe@linaro.org, qemu-devel@nongnu.org,
 shameerali.kolothum.thodi@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, imammedo@redhat.com, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MfMWEw1AeZ3s

On 10/14/21 5:05 AM, Michael S. Tsirkin wrote:
> On Thu, Oct 14, 2021 at 01:56:40PM +0200, Eric Auger wrote:
>> This series upgrades the ACPI IORT table up to the E.b
>> specification revision. One of the goal of this upgrade
>> is to allow the addition of RMR nodes along with the SMMUv3.
>>
>> The latest IORT specification (ARM DEN 0049E.b) can be found at
>> IO Remapping Table - Platform Design Document
>> https://developer.arm.com/documentation/den0049/latest/
>>
>> This series can be found at
>> https://github.com/eauger/qemu.git
>> branch: iort_Eb_v3
> 
> ACPI things look good
> 
> Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> 
> ARM only so ARM tree?

Sure, I can take it through target-arm.


r~
