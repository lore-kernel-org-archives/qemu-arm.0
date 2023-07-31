Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2002098ejb;
        Mon, 31 Jul 2023 00:44:56 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGyBA5ECJxnRT9sTqP7/qguXVSHrKP9YtZhhNBve3rphgDSRVXlaGqo6zOvTK08WDzRxI6z
X-Received: by 2002:a0c:df89:0:b0:63c:f0a7:cef2 with SMTP id w9-20020a0cdf89000000b0063cf0a7cef2mr10223866qvl.25.1690789496683;
        Mon, 31 Jul 2023 00:44:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690789496; cv=none;
        d=google.com; s=arc-20160816;
        b=NPffrakELoaySrE1FS3+xE0N94Xk7iTWcCEauFJFN4JjquC1E4CwkgwjA68TkadkOB
         x+jCrKh7vyg7hJPQwYYSuOYGmjJlZrQGXtqkuIENDmrofOJ6c0yknG7G9to+TJJ+RHkh
         do5DQdyGZCLzb//II7qcLzAKvFEae0hHuLKx3IlNAaJX8QAIEypM8cQkEqaHPN86BsZT
         0qJY+XswJ1sGU3Hkb4W/3CHpzhUXi5K2asAn3OYWzFPEi0Qtnism3u3Y1iix+r0JQgjJ
         tVvNMTR2kGT4cro2Rgz7KOGfRcBKijR1QzcuTnXdfQkkR2s6jICaUtE37w99d2/DSmjK
         oIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7ElsIsOtJ5Znlz+lpzCgNdYqKc3kJAkdtbQfydrsYeA=;
        fh=o+KmjbnwQstJger2O7DN/SdbInfbsakgHzcDoCjU+rI=;
        b=fU5Ua4rrkLgwLIdCE6ghJpi6OPJNBbms8Ntj+6FCbm2IQ3gaUXIam60mXlpfpDLMnt
         aBl4J+57thYte1qHp5vmHmwqItrVrabC/9YraB8sDRpLswbDMjd9GwpjCtOp8CzqwxBK
         5xF5zK07t+qBsPdy9IdogBEWz+YxPzPSCtwf4J+Md53kLrsbIT8MrVloOXHfR+EhZPhY
         OHmfx8b2wO0SVRljmR5S70+xQvMK1OYMm18a5BfPFu0krZLlukCzsfYYn6nzJ9qxm9R8
         Ct6eA7BM3kylb5A6druX7JUp91plb5DbbsXN1/6NNLMnO0MvpuYsAEW60pmmohIYk3jY
         gkYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UrInTiIj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay13-20020a05620a178d00b00768324bb941si5529368qkb.306.2023.07.31.00.44.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 00:44:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UrInTiIj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQNZw-0007h0-2v; Mon, 31 Jul 2023 03:44:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qQNZu-0007gH-F7
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 03:44:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qQNZt-0002tl-3t
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 03:44:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690789468;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ElsIsOtJ5Znlz+lpzCgNdYqKc3kJAkdtbQfydrsYeA=;
 b=UrInTiIjwO1mftNnPh4YqvLsZWbOt7dC4wb+AOadFofhFQwQ76yEgbNjuCRy3oJx3/t51/
 I9BHieY0p5tfxpGJ9sQc5Mv7OOcVXj4dwHmntaJYvFfI+Wz89Nyio2kheV5dNEzsaaTkl9
 wJbLxwCVMolGCrau1Q8Jngm7NcMV3GY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-qbxjVzt2POuT90F2Lovm8g-1; Mon, 31 Jul 2023 03:44:26 -0400
X-MC-Unique: qbxjVzt2POuT90F2Lovm8g-1
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-76752bc38bcso669528785a.2
 for <qemu-arm@nongnu.org>; Mon, 31 Jul 2023 00:44:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690789466; x=1691394266;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ElsIsOtJ5Znlz+lpzCgNdYqKc3kJAkdtbQfydrsYeA=;
 b=QNJhSB9t49TooUOpEwpj8FNzEZyCdbBsAaVak3H/miZ4HPFtjUlNMc3eDtle0wEgrJ
 FylBzYjJcztyh03EH1VOCk26fv+LIuMu+OrEN0hB7Craq//FUmtHK95xijRp+ex9FV9G
 hTh0uhvnF8PN2cyueWdwxR52qfe8S3FdgxiMFPnQzzwZhuE57F1/n5+/fWVAevnLsVc9
 g9cL3U7MCZKik7EdOY1InG6NAtNOGO4u/t4SHuPC4VwAfL38IC6vsp/EZSmW5DsZ2FzZ
 kwtFw9TiT5saB9dAR0Kk3W0aToyjfq3ddqsHtlcEXXOpcEzEYcjJwQ+xNe/sc9NPxcjZ
 ac3A==
X-Gm-Message-State: ABy/qLbjQAQke5IS6MP5QCRpaTg+FeIsrk/KBAfpueaxh1v/LXkLJETw
 NEyvrAV0DInXmbYdrcThEx4eE3wBr9ZhdJJGk2Z9T0M22KKzVUqYYitYUMGSJpute3UhxK5PtGg
 i+caw3gwIHm/X
X-Received: by 2002:a05:622a:19a9:b0:40c:8f5d:1b3 with SMTP id
 u41-20020a05622a19a900b0040c8f5d01b3mr8006740qtc.41.1690789466533; 
 Mon, 31 Jul 2023 00:44:26 -0700 (PDT)
X-Received: by 2002:a05:622a:19a9:b0:40c:8f5d:1b3 with SMTP id
 u41-20020a05622a19a900b0040c8f5d01b3mr8006721qtc.41.1690789466338; 
 Mon, 31 Jul 2023 00:44:26 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 a17-20020ac86111000000b0040b8ba13701sm1757950qtm.52.2023.07.31.00.44.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 00:44:25 -0700 (PDT)
Message-ID: <54738824-42c9-a8f5-f174-bbb1dafa844f@redhat.com>
Date: Mon, 31 Jul 2023 09:44:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/3] tests/migration: Add -fno-stack-protector
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 Juan Quintela <quintela@redhat.com>, Peter Xu <peterx@redhat.com>,
 Leonardo Bras <leobras@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Richard Henderson
 <richard.henderson@linaro.org>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, Brian Cain <bcain@quicinc.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
References: <20230731065904.5869-1-akihiko.odaki@daynix.com>
 <20230731065904.5869-3-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230731065904.5869-3-akihiko.odaki@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.101, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
X-TUID: n9M4lgSp7062

On 31/07/2023 08.58, Akihiko Odaki wrote:
> A build of GCC 13.2 will have stack protector enabled by default if it
> was configured with --enable-default-ssp option. For such a compiler,
> it is necessary to explicitly disable stack protector when linking
> without standard libraries.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/migration/s390x/Makefile | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/migration/s390x/Makefile b/tests/migration/s390x/Makefile
> index 6393c3e5b9..6671de2efc 100644
> --- a/tests/migration/s390x/Makefile
> +++ b/tests/migration/s390x/Makefile
> @@ -6,8 +6,8 @@ all: a-b-bios.h
>   fwdir=../../../pc-bios/s390-ccw
>   
>   CFLAGS+=-ffreestanding -fno-delete-null-pointer-checks -fPIE -Os \
> -	-msoft-float -march=z900 -fno-asynchronous-unwind-tables -Wl,-pie \
> -	-Wl,--build-id=none -nostdlib
> +	-msoft-float -march=z900 -fno-asynchronous-unwind-tables \
> +	-fno-stack-protector -Wl,-pie -Wl,--build-id=none -nostdlib
>   
>   a-b-bios.h: s390x.elf
>   	echo "$$__note" > header.tmp

Reviewed-by: Thomas Huth <thuth@redhat.com>

