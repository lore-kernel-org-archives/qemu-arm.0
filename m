Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6147DC5DF97
	for <qemu-arm@archiver.kernel.org>; Fri, 21 Aug 2026 23:12:05 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wxYOl-0002gI-Bc; Fri, 21 Aug 2026 19:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxYOk-0002fz-6k
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 19:11:42 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1wxYOi-0004vX-Kh
 for qemu-arm@nongnu.org; Fri, 21 Aug 2026 19:11:41 -0400
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-cb5b8572b70so1988094a12.2
 for <qemu-arm@nongnu.org>; Fri, 21 Aug 2026 16:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787353899; x=1787958699; darn=nongnu.org;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=T26CDWfmqq4Q7TILhhMDl7DvT2hnD6KCeMd1SqYDqH4=;
 b=ph7sIlyG7O1A8dKvW7yjjM5gMhEB3IsixsfsvptoDDDVoRIk3w0XzTMzeEkhvXdiyu
 Ri8PHooabOyU2XQwG0EL+IKtk4BQiufsjsC6vOG9jjDQ7ZuJrL1IMsxHLTSNezwaNdl5
 bhP+0ijckYbU6epXYQ5CIoIPjjVT7akbL7Nc4rixia4JRmwtDVfMEsxpHJkLklY+GR7+
 x8NMCxzTr+WtACxrTSDLgJd9mvICRTb4e8JtCeg941SpbhnhmUYERQo4gjhyMfG2j86U
 dJKslNZJVU1TJcoWij39wTpeTcJ9tN9m+VGClauU0vBV5iywnQgexspVoT0sK4srYxa+
 gpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787353899; x=1787958699;
 h=content-transfer-encoding:content-type:in-reply-to:content-language
 :from:references:cc:to:subject:user-agent:mime-version:date
 :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=T26CDWfmqq4Q7TILhhMDl7DvT2hnD6KCeMd1SqYDqH4=;
 b=HXBTlpDPVTPPaouAxNUGqgUwVuuJkjc8H720osKWDPowc7LVx03mIkqSe1GUSt8hsy
 tT+6Gt/mW9BO0hKe+VXiOBcRLO518nSGrCW0Ml+/81VZgM+ijyDc0gDLTaEeSmIR3Xss
 mdvvif0AXI+rYbpq3vPjCeg6Lh0d0ZaMVYfW6Zszl1DOYjJf6yYoM84MKn40lj7EyZtR
 iZHwv9FpaJq14o0nQSjaHxoTgSAcMHp4aodNyOT8Te4B3GZHyAdp3iUaLB8Uz3mUxPd8
 xV2C3GbdYSTVBm4Y5mC6OF38m+w6n304Qp/l1Rc92GGGU8enYM2SShIetS9zG8N3UQbJ
 gjNw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqdsSvmazGty5X8c/e23Uwlhge5nrJhJg9PVtWwJYmOWAPfF4FDW3q10c1V/dPzLThwzhzaPoy++w==@nongnu.org
X-Gm-Message-State: AFuF++kvl9Df+WfYsVtWPfV+lA5DRL5PXDWBSJ0jk2SUxl/d8Qp4C3jW
 3i/P2QqJf4ZQPOCsCrcHHzgsns007jGDNfn2tFTRurbCnCVywSmTcDgNTH38zrBzhcM=
X-Gm-Gg: AR+sD13bUEEmwbSPYZSxY9gC9wyIY+oJVSPD3C1lREhNHH3uV4mkSOhsyPl6wTCiK2A
 ti+xXh684B9tCKybeHxJE881onOHGVDorx2o2yyYUyU4pTNuON0C87aHwOtghp+fjW0lWYM5XI+
 UoKFzdrmvw/3hrCk+uU1dXsnPJTx+yY1jFez+l8/+8b1YLMsZbmf5KEN6RborwlFfLrOLgVa9pZ
 iLg6aAL2bVvG1er+x+KIHxGUKM5v8EA1AXYbuJtLofuqBxGCqE00Y5Tmcmw6qwdf96MBwseW+ds
 FgSvVCPT1dYwq93t8yAOUSk98WmXOdXv67YjZLW5aNkMo2sGeGVID8K2f89/h017fh/U3Twipb2
 q/ZT8Oa17bMkQEBFapBM2N+XySU0zhiiuRgdEzTIZU4sx7RIeHwGk1ia8axRo7TY/wxJWQA7yql
 SQlRkHYfvs9ooSKr9d1Gc2pjW58fL/SpGE+8BVKbvvRxH0DTuaLYlZ6QbtQGr43AuxawcKlnQk7
 4AsgbeUyQKaLfivXSN8zZBgKKhmY4Ee/DeIW3WVGYDu6yzkRw==
X-Received: by 2002:a05:6a20:394a:b0:3c3:791e:5e18 with SMTP id
 adf61e73a8af0-3cd2fe7a34cmr17385811637.7.1787353898875; 
 Fri, 21 Aug 2026 16:11:38 -0700 (PDT)
Received: from ?IPV6:2607:fb90:339b:bfd7:dac5:d94a:debc:5ef7?
 ([2607:fb90:339b:bfd7:dac5:d94a:debc:5ef7])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cc1593060e8sm3357847a12.32.2026.08.21.16.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Aug 2026 16:11:38 -0700 (PDT)
Message-ID: <ef89a1f0-1df1-4d41-b0a9-603556a76b33@linaro.org>
Date: Fri, 21 Aug 2026 16:11:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PULL 00/12] Igvm 20260821 patches
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
Cc: Ani Sinha <anisinha@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Zhao Liu <zhao1.liu@intel.com>,
 Peter Xu <peterx@redhat.com>, qemu-arm@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Laurent Vivier <lvivier@redhat.com>, Fabiano Rosas <farosas@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20260821161103.3489298-1-kraxel@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260821161103.3489298-1-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

On 8/21/26 09:10, Gerd Hoffmann wrote:
> The following changes since commit ae4f3443209ab154b48b706a146e5f557ab147cb:
> 
>    Merge tag 'qtest-20260819-pull-request' ofhttps://gitlab.com/farosas/qemu into staging (2026-08-19 08:21:57 -0700)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/kraxel/qemu.git tags/igvm-20260821-pull-request
> 
> for you to fetch changes up to e27a2b5f36a0fc913ab9a55a00f77a33ec6cc4f0:
> 
>    Update MAINTAINERS (2026-08-20 16:40:33 +0200)
> 
> ----------------------------------------------------------------
> igvm + vmlaunchupdate: allow guests supply their own igvm firmware images.


Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/11.2 as appropriate.

r~

