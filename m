Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp216445ejc;
        Thu, 19 Jan 2023 02:12:37 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtFOU0TZIfcefJG/2UmtvpilE8fh4y6cZyx5fxo3t8/jvoZWVLNdlwGgETM/2yOcc1NsgeX
X-Received: by 2002:a05:6214:3389:b0:532:d39:1936 with SMTP id mv9-20020a056214338900b005320d391936mr15002380qvb.9.1674123157771;
        Thu, 19 Jan 2023 02:12:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674123157; cv=none;
        d=google.com; s=arc-20160816;
        b=l61c9jZzSePyufcCTW2MiriVQDjfg2hZK7t/EiEySvGYL3zgCbIDxaOmL3AfiIjkVL
         9L7fOJCvSQ3DwpDpngJDXLQzz4FC5kfs46lNc19gs0gP48ccFWBw8H+/cZxhfwBWVPtX
         6jO4ce8DiQpHBGaJL5ZCC5OawyRLt+waBTf9BzglzVbaEFsUHbyRCGxaWBpjlFVhp+2X
         94qd0+73mhKq0tmML3Qz/rMOYLjMbEoP9UQ+2edpoU2JE9TN0gCNdKEZeW4ntQwu9xAM
         SoKZIzLvmANIK8zYwEJYIyzrM5cEArSd4kxcuwYJDaXRibGHRDADJNFNYGoHthOGPQ5l
         0c1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=Vl97WCso3fcvzunktBd7OBr/bZcQA9f9s3BSK6lGWZM=;
        b=s788K1PjzHVXWlV/YQSRZMkkZaMVXcf9P+7yr1vgfH0FFgB/IvbklJpETpVBa2NF6A
         8wbSJlzJuopjiGC/3RHJI2gXWLOsJcn4BRy1q+rvOo18Fb/kUW/le8XaTRhlDBI8L/EC
         ymbFt1Et5KccX0Ub/QLSN+y43k9KZNnfMUnyDwIeUJTPd5haT0w5i9IarFjRXRNBNI1y
         fwNLlyEplBo2ADkeoN7nOPEc728l8ymodoGi00WYr6XGqHhyzV0KdP3AtyItagiWQGaX
         nPUCY2yOmJ+zV5v7FyKLGo3kzgBR32eNIx8Xm9+aK8k5LEovIdnBnup+DntAKOIcfIhK
         YAug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw5-20020a0562140f2500b00534f9174377si2384241qvb.219.2023.01.19.02.12.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Jan 2023 02:12:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pIQX5-0006Vr-VJ; Thu, 19 Jan 2023 03:44:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pIQX4-0006VT-HF
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 03:44:26 -0500
Received: from 8.mo552.mail-out.ovh.net ([46.105.37.156])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1pIQX2-0007PO-99
 for qemu-arm@nongnu.org; Thu, 19 Jan 2023 03:44:26 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.33])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5720D2EC51;
 Thu, 19 Jan 2023 08:44:12 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Thu, 19 Jan
 2023 09:44:11 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004e3e183e5-faf5-4837-8209-c44439dc7ef8,
 57C062BC11404EA56320B07D289517251D163FA5) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <0dbdafa0-d860-a7a9-f1cc-dae28251fd83@kaod.org>
Date: Thu, 19 Jan 2023 09:44:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] target/arm: Allow users to set the number of VFP registers
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20230102175245.1895037-1-clg@kaod.org>
 <CAFEAcA_m59FxCGFu1aF8j1nfib=W49e59w4LNYx3Cj5NOmYufw@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <CAFEAcA_m59FxCGFu1aF8j1nfib=W49e59w4LNYx3Cj5NOmYufw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG1EX1.mxp5.local (172.16.2.1) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: cc6156a0-b03c-4b76-9ebf-c1327fce6310
X-Ovh-Tracer-Id: 206039684871982045
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedruddtledguddvfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitgcunfgvucfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepuedutdetleegjefhieekgeffkefhleevgfefjeevffejieevgeefhefgtdfgiedtnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddvjedrtddrtddruddpmhgrihhlfhhrohhmpeeotghlgheskhgrohgurdhorhhgqedpnhgspghrtghpthhtohepuddprhgtphhtthhopehpvghtvghrrdhmrgihuggvlhhlsehlihhnrghrohdrohhrghdpqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrghdpqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrghdpoffvtefjohhsthepmhhoheehvddpmhhouggvpehsmhhtphhouhht
Received-SPF: pass client-ip=46.105.37.156; envelope-from=clg@kaod.org;
 helo=8.mo552.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.089,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: CWFNa7/Xm/7o

>> @@ -1650,6 +1656,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
>>           return;
>>       }
>>
>> +    if (!cpu->has_vfp_d32) {
>> +        uint32_t u;
>> +
>> +        u = cpu->isar.mvfr0;
>> +        u = FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
>> +        cpu->isar.mvfr0 = u;
>> +    }
>> +
>>       if (!cpu->has_vfp) {
>>           uint64_t t;
>>           uint32_t u;
> 
> There should be a check so the user can't both disable D32 and enable Neon
> (Neon always has 32 dregs).
> 
> Armv8A doesn't permit D16, so we shouldn't allow that combination either
> (but note that v8R, support for which just landed, *does* permit it).

Like below ?

Thanks,

C.


@@ -1661,6 +1672,26 @@ static void arm_cpu_realizefn(DeviceStat
          return;
      }
  
+    if (!cpu->has_vfp_d32 &&
+        arm_feature(env, ARM_FEATURE_V8) &&
+        !arm_feature(env, ARM_FEATURE_M)) {
+        error_setg(errp, "ARMv8A CPUs must have VFP32");
+        return;
+    }
+
+    if (cpu->has_vfp_d32 != cpu->has_neon) {
+        error_setg(errp, "ARM CPUs must have both VFP32 and Neon or neither");
+        return;
+    }
+
+   if (!cpu->has_vfp_d32) {
+        uint32_t u;
+
+        u = cpu->isar.mvfr0;
+        u = FIELD_DP32(u, MVFR0, SIMDREG, 1); /* 16 registers */
+        cpu->isar.mvfr0 = u;
+    }
+
      if (!cpu->has_vfp) {
          uint64_t t;
          uint32_t u;

