Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp342888lfg;
        Wed, 10 Mar 2021 01:03:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy7/jtJLRPDZf8RdI86w1tnTDr71P8YC2WCVVa1/w19xwFCAN7scyfkqX+66Ibno8GxXe9c
X-Received: by 2002:a05:6638:11c2:: with SMTP id g2mr2047045jas.64.1615367002777;
        Wed, 10 Mar 2021 01:03:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615367002; cv=none;
        d=google.com; s=arc-20160816;
        b=cddR5p2qMGY4vcpGAwpItwwAbGZxWsrvo/WmiSXzN1mrhSilxwskwgrDlChFHUNyrp
         zjJP7+D3wZvCE6Q4577p8R18YqHP8GF6aFeal60/ca3RdoQ9vg1rej+RS5y4DgFpbZan
         0b23ivm1Mg2rHbfn2eGmWMsmquA0R2n7r8ysrjl4fJP8u9NzPktnggzMDvisLC2IIx2O
         iX1HyukmDPIAt+7jphqKJTzK4xk6hnGJp2szwRa3Oer6e2YB4COonp/WRxyriAmE/RdQ
         B16YTd9Q6Re9K4YERk3ykO+gr19H7TN5fI0/CH0EVcHtgikFhSxVsiWOuxvLAGwB09de
         gcLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=EBmtnRfn+hleUHsUDWfhys9NXierXG7H0EZNwWIPfeQ=;
        b=jbLLCTzGpZVk3K0rMsGnOJSSJT1HLeEtCocoDArWeiZnIDD9zUz+GNW1O+ywO9Cx82
         9ihQscVv2myRoIIY3R1t9YzhSRtkbu52XbZysdn6PtDC80bmETs3VbN+jBexpFxp+e0c
         sfy2Rm6IT8ZwjFJ+RuNv2iubVYHD7ally2y4Wc2VrtmYut21SymeZ/owPhmtUYQBiezC
         gSXeYVHBJs5B9tNtWrgiXgVq9oWtOD1rIIsnLua2ajbSrWjQCMoFwygPkBRhNA1DBAmV
         MBFUprtxLya5wgfj6LKHXiFKCpDHGnwzsFQNa6cTamZ15oeLTlZFPY1nKDLEzdQhspq0
         C7YA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r21si17277690ioa.81.2021.03.10.01.03.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 01:03:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:50900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lJukU-00059E-2h
	for alex.bennee@linaro.org; Wed, 10 Mar 2021 04:03:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46968)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJukB-00053W-LF; Wed, 10 Mar 2021 04:03:03 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:34275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1lJuk9-00082w-Tr; Wed, 10 Mar 2021 04:03:03 -0500
Received: from [192.168.100.1] ([82.142.6.26]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1M42fA-1lJujr2TyK-00020D; Wed, 10 Mar 2021 10:02:43 +0100
Subject: Re: [PATCH v2] tests/acceptance: Add bFLT loader linux-user test
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Cleber Rosa <crosa@redhat.com>
References: <20210214194524.768660-1-f4bug@amsat.org>
 <cae49194-7c6e-4c5e-6407-687c08ef67b9@amsat.org>
 <9e790254-2153-f24f-693a-6ecf22de814a@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <712dcfeb-44a2-df1a-7df7-9a8c9cba341c@vivier.eu>
Date: Wed, 10 Mar 2021 10:02:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <9e790254-2153-f24f-693a-6ecf22de814a@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:h7suAFihuilv4HzLt4nCMm3rWnXnNPWtr+q5T+TrYsVm5Jn6hw/
 SgMKz4AYQoWuQV4O/I1UU630TDPkmjS4ZVc6GlOafRYAkquOZFwkIzW1ZNqKUXrztdi0Okc
 X5IkgdfpjajMn+SP+OpH+lhv2vy3vO6M5oi0xn65SquLOv12kCXrHXuWa/KzqAiSZTtFwt7
 NTfdTBUChaP0TpNTLncYg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MKjpDP4QS8I=:yEm3n1rKLkIV9qg6etd6o/
 iDEEWlpJPyU4sguau8ke/HDF6ModExgm6/8CJypvZR11JiUMG6vgQIuL4m4JOWNVx/PEodXrz
 IJaxzmMwxprHNAyROGs4wNDaVh8ZCOcpmPoiIJrlB3qklZMlabmxZYN/T2GmC4eXdVIbtjQ6s
 WXr2CPj9NQ4OVgJq5fzm5LAT2SawOM6jlGRBXon4SA09W2CaACkc8fnzxGHI20qlwID0We49D
 MpzV940UdicXJxtV2rw6Z3em/vU3Q6Ef5z7mosWuzQvTk39dFtecjxMSonFRHsWpK8Es9Smgn
 cpfrcRayUEN6UrH4ylWeEKqrWFNFjSkA6gDQLiSG9VRjAFc15Mxxe3M/J5Tw5GtQAeDhI8hVu
 GiZwVyWDP6Pm1iN/DvAGQc3q4qFsUzxe//BXTHKCj5nVEDTij+qUFinMdhe7T6Wc4bMQsxStL
 eJs7Z3pejED2GkzhWuvnwBn8e1Mk2goTX9feB/F+4p+x8HZgLtHo7edy5jGJVfMOERbYAY/pR
 NUoYHBzQ4TI4Y/iwc39N2A=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W1NWwHtmUuDj

Le 10/03/2021 à 06:48, Thomas Huth a écrit :
> On 09/03/2021 23.27, Philippe Mathieu-Daudé wrote:
>> ping?
> 
> I guess we really need someone who could act as a maintainer for the tests/acceptance directory, who
> could pick up patches and send pull requests if nobody else is picking up these patches...

I can take this patch via trivial or linux-user, but I need at least some Reviewed-by.

Thanks,
Laurent

