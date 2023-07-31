Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2005639ejb;
        Mon, 31 Jul 2023 00:54:45 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHFZ0OyCV6dVy6hO9ZdmuxnM3Pz9v2BJ4HZ2Q4Iep9/fc0RwEUX9nFLiY3Dq53aexjGMFAN
X-Received: by 2002:a05:620a:40c2:b0:767:fec4:1eb9 with SMTP id g2-20020a05620a40c200b00767fec41eb9mr11368153qko.69.1690790085200;
        Mon, 31 Jul 2023 00:54:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690790085; cv=none;
        d=google.com; s=arc-20160816;
        b=lUMONLa6LYgekfVXL35QnOoNgMvVInhHAzIyekGj5JD0lB1tFAN13Ku2MSSCuzpWUz
         vAxpbeufhQ1S2Ws66syh9Bygt8XRBv3vK3KFPpVyH/5rkRDYnRMKNETc+xZtzVURqH0V
         EFcdlGnJH1kPplih9g0ZidAuDabs2SBGD4tHE7DVuRFwuLOaZxeDz55EGnHAAeQzTMG5
         3BGg9iMaq6fLIhNnwfrbT3XkvUNxmCqlUx/9OewiDBJHramvtldcDP6mKqdNUJVEF/7V
         eulGjjBpZLUTUVtCQQn4jOy7SrpZkGuK/2xZKSjjXEe0n7RRVVqzIUMTowlQ7XzjYdFv
         RgdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7ZO8/+xFrYFUUplmprpXkdk9gdtVNU+g6sTlEM4wmig=;
        fh=o+KmjbnwQstJger2O7DN/SdbInfbsakgHzcDoCjU+rI=;
        b=PYPo3e5xJMaO2E3pYDIYcfm8bv6zqMhJifIjZVZvOwdc+/J6mBTVfyU6fdBMXud5zc
         EzVw64vu7HSJQ2Jjx9kSytUdhyFT78kKOwV05Xi01OwgFKn55ARmP5oV6HknNnBHpdQi
         nZtF1F51cpSRxcJB6ZKB0sKC7zwmdUz/FH2s7SzNpFVNBWqfnsqashzJVgyLL5b9pjx2
         DUoFY8+9u87z//6ZXDnC9gr5kNTFDvn5I8I2a+4bo4dcwf2VdW1Ft8wj7jIcuEsbiiwK
         S/h85iiolgZbtJVGZE3MTHNF/anPbfRqg4f0ufx57lDFVZwKiH4TbHg6HNAs/QOUzuTE
         vgTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bSF5Hn1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qh22-20020a05620a669600b00767185b2dfasi2277946qkn.622.2023.07.31.00.54.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Jul 2023 00:54:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bSF5Hn1K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qQNjc-0004eZ-TE; Mon, 31 Jul 2023 03:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qQNjb-0004dq-Av
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 03:54:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1qQNjZ-0004Ke-UL
 for qemu-arm@nongnu.org; Mon, 31 Jul 2023 03:54:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690790069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7ZO8/+xFrYFUUplmprpXkdk9gdtVNU+g6sTlEM4wmig=;
 b=bSF5Hn1KJU95KOoN3xBYymqnfKeHmmWCBvHiMNyi2bQI55Ey2BFcFcLBgF0kA+nmd4C8ad
 1uNaWYumze9n8mIoocEAiYYeuwB5TGvKo3OMlr/81iSc77DZ/8B6ltfkJ6BweMHssLr6Nk
 z6K1IkkKfUxwOeI+RpLkiFEUihDxeKo=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-nF9F35hDMla47R9K8Mlqyg-1; Mon, 31 Jul 2023 03:54:27 -0400
X-MC-Unique: nF9F35hDMla47R9K8Mlqyg-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7623d5cb0caso431338585a.3
 for <qemu-arm@nongnu.org>; Mon, 31 Jul 2023 00:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690790067; x=1691394867;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7ZO8/+xFrYFUUplmprpXkdk9gdtVNU+g6sTlEM4wmig=;
 b=k+HAgk5YSwucAbHsIz4UNaLiA9w8TNezPHvoBnBUVQ3J2nekLUKnGV55Ri37vrD2qF
 atpLdGAotgdPABPsdmh1Rs106PtnJFkbqnnHo3JzW6JdgdjJuisNfxzbNQICsL8DezkY
 xbdfB9wrnlr3QpOgZvZ6iMp4Fdi/RnIyD3daPdgOqZ+s/6VZcyr1L2F2sBjIv/H4jN2R
 9qKb1DA1vUT1BI5ekHekw9t31dgTNHEyK/t69io0cXd0li/X0efGoJVBh4TVVxbLdB5N
 PkcrYvT9QwfFOBShZlOL8gmURHxG93OVCFlE85sXZO/WJY21+Np6wo8U8fhWq6B9EPLj
 Y62g==
X-Gm-Message-State: ABy/qLaMZ7L9ny81y2+IiWUwCJZkCrekBZ1ZkkfF27G1ZyC0y8UCTFKT
 igLQs4VzszAo60F1rifTRMiPXYVBLU6WXTVyr8JLKk62YUzMvzhJmPhavSDiMh76vhVmQekyoty
 9V3mQRoeCOTLv
X-Received: by 2002:a05:620a:3189:b0:76c:54bc:ad1c with SMTP id
 bi9-20020a05620a318900b0076c54bcad1cmr10030222qkb.18.1690790067234; 
 Mon, 31 Jul 2023 00:54:27 -0700 (PDT)
X-Received: by 2002:a05:620a:3189:b0:76c:54bc:ad1c with SMTP id
 bi9-20020a05620a318900b0076c54bcad1cmr10030213qkb.18.1690790067011; 
 Mon, 31 Jul 2023 00:54:27 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 b26-20020a05620a119a00b0076c701c3e71sm3036372qkk.121.2023.07.31.00.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jul 2023 00:54:26 -0700 (PDT)
Message-ID: <51ef9524-5550-1331-41e1-a349a6260ab4@redhat.com>
Date: Mon, 31 Jul 2023 09:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/3] tests/tcg: Add -fno-stack-protector
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
 <20230731065904.5869-4-akihiko.odaki@daynix.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230731065904.5869-4-akihiko.odaki@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.101, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: zcaZq/063Of4

On 31/07/2023 08.58, Akihiko Odaki wrote:
> A build of GCC 13.2 will have stack protector enabled by default if it
> was configured with --enable-default-ssp option. For such a compiler,
> it is necessary to explicitly disable stack protector when linking
> without standard libraries.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   tests/tcg/mips/hello-mips.c                   | 4 ++--
>   tests/tcg/aarch64/Makefile.softmmu-target     | 2 +-
>   tests/tcg/aarch64/Makefile.target             | 2 +-
>   tests/tcg/alpha/Makefile.softmmu-target       | 2 +-
>   tests/tcg/arm/Makefile.target                 | 2 +-
>   tests/tcg/cris/Makefile.target                | 2 +-
>   tests/tcg/hexagon/Makefile.target             | 2 +-
>   tests/tcg/i386/Makefile.softmmu-target        | 2 +-
>   tests/tcg/i386/Makefile.target                | 2 +-
>   tests/tcg/loongarch64/Makefile.softmmu-target | 2 +-
>   tests/tcg/minilib/Makefile.target             | 2 +-
>   tests/tcg/mips/Makefile.target                | 2 +-
>   tests/tcg/nios2/Makefile.softmmu-target       | 2 +-
>   tests/tcg/s390x/Makefile.softmmu-target       | 2 +-
>   tests/tcg/x86_64/Makefile.softmmu-target      | 2 +-
>   15 files changed, 16 insertions(+), 16 deletions(-)

I think the changes to the Makefile.softmmu-target files should rather be 
done in a central place, in tests/tcg/Makefile.target, right after the 
"EXTRA_CFLAGS += -ffreestanding" there.

  Thomas

