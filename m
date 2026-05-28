Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82CAECD5BD5
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 07:33:04 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSVDu-0008Sh-8D; Thu, 28 May 2026 03:32:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSVDq-0008Lg-Ov
 for qemu-arm@nongnu.org; Thu, 28 May 2026 03:32:08 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1wSVDn-000689-DC
 for qemu-arm@nongnu.org; Thu, 28 May 2026 03:32:06 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-459bf19e87bso7483862f8f.1
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 00:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779953522; x=1780558322; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=9LWPOs2Ju2J8pG8wru04Q+1RDnSE64nD1JGRnbxc5Ks=;
 b=SghT8nm6dTZYLEhndLtBn68lCIEONyuBYVO76h5ZrUn2VUaT6zE6VScjeFv7XkkFgI
 9yc2I9GdlCh/pwDXrFQussY20Y5Clh+dwKcvtwbeXFcuhNfYyZfvQ2DwBRE4cvruQDtB
 pDlBk9vn4cgIqtgYjiXEyuuAPWFZIotiTYnRCxsfPFWTGIH4rjr+JdHcGr0/ryvPTi1t
 ocoxf1NbhL1SQhCjjGyWyzH11/NPzkRsCtL5cRLczmNAvaHliI1gbM389YRwr3wRgkFq
 Mxto4hSl7y2oOJM3JEN7Yr+SH1w7Cq1l4JNrFcshhwV3PwUmR6rEbESPXAjkaawNzD8s
 mIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779953522; x=1780558322;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9LWPOs2Ju2J8pG8wru04Q+1RDnSE64nD1JGRnbxc5Ks=;
 b=I1aUxIi3cUvMdZ1EoncvlY/nY5QfL/JNPZBjUzCr5+rt1u8W8C/BK6pioCGjxJQqBQ
 nKBb0giq+Tnp4sN3nf85RoL5f/8q1lZXFj/8PMmSuiQufzndxShNfN9N+PZ3VdfXbiPy
 0K4Ij8lt9bcbTGihmuTW/U9Qfxy2gSl6e8huVzgoBzEljtFFD+6//FgfEa3yjZcrLHOn
 hH57qUl4ZoiI5G3jGgi0I1b3QTQBvabAADI8rAI/3IH9huu6xXunsZURc9Bes833QXeD
 i29kvig6/NHxeMbvC1WsW6JgqEc5oCa6AHB7+7+VWKiiUaRdeCYO0T23CvN7HoS8epkH
 6iBw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8srZI85J1gzOxsrVBFJ465avcvMrwiuOmU22j9yQpYr94maCj3ec5Y0CRIaUFnQP7UQPcgNYHQQg==@nongnu.org
X-Gm-Message-State: AOJu0YzUYwNYFkW97cgzuFNuYWnHzt9u6TKUEpPOwYVNGmVvIUbBycIC
 sDERetS3p4KItvb8d/i8Mwq65AiLgjvHUMzfKZEZMLOP9gRUKzQsjtv9Maay/fxhQRw=
X-Gm-Gg: Acq92OGS15cr6oNNkm2eNPvoB737IidZSBje5Y2zyyLU6NzNEWTFwkYSRDtUDw3IgSc
 0E+8+3GL2nr41Mv7wiXON9leFN7VMNJUrCP11USrLZ5hn6yWRt4uFpzAXCPSQbP2nedBeFcaGyW
 DnFjn7TTfEPod66S1iH8lpBuWE2LBMiX/BoNv8ZHo4AhRmff+REEdIxNS02dNRKXVQ6gLu5vfbJ
 GzqYUfevyRg6ktfA3ReROK7pCryAnHa6YyicbBEwprrJJfYvm5iP8MFR5tjekR64hElBvrQjHu/
 5W5E6hW3jkX/2tuM9jNzTBWmzalNihq7WcymAlJ85FWWZVs68nQSV1AvOcwYVo0tAX8acAqmoI4
 ROGyobVSdYzO2f3ipXxP59kQVblopqN/qA4xvcdkU25uUF5old2jVATrX7CNCWflhWTM7k7zjXM
 k8iHHcVdu1yFCcKegEn8JCd/helnIVlileeDV6SRJ0AF3zPcMBNdOFiy3UmDr4d8yp65Irf+KSZ
 DfL
X-Received: by 2002:a05:6000:400d:b0:43d:1cec:4766 with SMTP id
 ffacd0b85a97d-45eb38c52famr42422051f8f.23.1779953521738; 
 Thu, 28 May 2026 00:32:01 -0700 (PDT)
Received: from [192.168.69.207] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45edb5b1c7bsm11594438f8f.29.2026.05.28.00.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 May 2026 00:32:00 -0700 (PDT)
Message-ID: <6f46ca78-26dd-4de3-85a1-a73a7509dd28@linaro.org>
Date: Thu, 28 May 2026 09:31:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/10] meson.build: move some subdir before system lib
 creation
Content-Language: en-US
To: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Weiwei Li <liwei1518@gmail.com>, Helge Deller <deller@gmx.de>,
 Michael Rolnik <mrolnik@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Glenn Miles <milesg@linux.ibm.com>,
 Daniel Henrique Barboza <daniel.barboza@oss.qualcomm.com>,
 Chao Liu <chao.liu.zevorn@gmail.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-s390x@nongnu.org, Zhao Liu <zhao1.liu@intel.com>,
 Alex Williamson <alex@shazbot.org>, Brian Cain
 <brian.cain@oss.qualcomm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-ppc@nongnu.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wang <jasowang@redhat.com>,
 Stafford Horne <shorne@gmail.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>, Song Gao <gaosong@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Mohamed Mediouni <mohamed@unpredictable.fr>, Peter Xu <peterx@redhat.com>,
 Pedro Barbuda <pbarbuda@microsoft.com>, Chinmay Rath <rathc@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-riscv@nongnu.org,
 David Hildenbrand <david@kernel.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@mailo.com>,
 Nicholas Piggin <npiggin@gmail.com>, Aleksandar Rikalo <arikalo@gmail.com>,
 Fabiano Rosas <farosas@suse.de>
References: <20260528051642.115721-1-pierrick.bouvier@oss.qualcomm.com>
 <20260528051642.115721-6-pierrick.bouvier@oss.qualcomm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20260528051642.115721-6-pierrick.bouvier@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

On 28/5/26 07:16, Pierrick Bouvier wrote:
> Allows to use stub_ss in those sub directories.
> 
> Signed-off-by: Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>
> ---
>   meson.build | 26 +++++++++++++-------------
>   1 file changed, 13 insertions(+), 13 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

