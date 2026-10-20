Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 497F5606A32D
	for <qemu-arm@archiver.kernel.org>; Tue, 20 Oct 2026 07:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NCvTxcPO
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xJ4VZ-0001cX-Ny; Tue, 20 Oct 2026 03:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xJ4VY-0001c2-JY
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 03:43:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xJ4VX-0005jp-1l
 for qemu-arm@nongnu.org; Tue, 20 Oct 2026 03:43:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1792482218;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=krdXaPnFGrq42mp4rmeldNAjyfxHL9My08C1j3HYO0k=;
 b=NCvTxcPO0s/X4VzhqzsUCmb/ZLVr6WBrArG01c2oFcHokzi7+aCjnYXX8ikMcZsDquBLkh
 LR0lZEvpyaPCm9H1gzziNc97JSqW8eD+GZei77WjWedJobUtFHSfghNxqG51xbKHG6ceAu
 3+TjZQJSP8x5Wr3J2mV1R5gZYhFNe5c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-10-gmGaVXEGMuGxdaQDa1LJSA-1; Tue, 20 Oct 2026 03:43:36 -0400
X-MC-Unique: gmGaVXEGMuGxdaQDa1LJSA-1
X-Mimecast-MFC-AGG-ID: gmGaVXEGMuGxdaQDa1LJSA_1792482215
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-49febef74e3so3004205e9.0
 for <qemu-arm@nongnu.org>; Tue, 20 Oct 2026 00:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792482215; x=1793087015;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=krdXaPnFGrq42mp4rmeldNAjyfxHL9My08C1j3HYO0k=;
 b=NRzvHQI6GghY5mIIm/cYJPIRuiEFYhX/16gX8noizNKtBeD+1UVUYXKiVwSL5Licag
 8fgX0vIUfNre9pWmjLhlwiLGeg4ywu4K8mmE61b3kxF3fZbp9V9XqBH2C/id+5GECCmB
 3VgmcTYeX+o/UURbceKXBwOyHMfadczyl4RkFlOSi+dh40fXU7NhdaxatYMtMrW/BCWr
 Im0M/x7TQvanM3+w38umWdp0ImhdTtxAVRC2r2i+SNZT3pWZIOlsatC2QszzZhgrFeEA
 AKu3RG0938KnahUxcypUQOml28dMXFnBn+9axp+liZrNhjf1sir6WV/Rd9P1VOb61u+Z
 tgkg==
X-Forwarded-Encrypted: i=1;
 AKwUvBz8KPDNLTPQIxiXwyB4rUSqwcTvq8ng1f24f8QHk7aWgnDgLI4ZUGlQZYeanl4XFrU4BB4I67gpBg==@nongnu.org
X-Gm-Message-State: AFq9FYIH/IGQwVHk38azHL1T7aQgG8BiAYzRO+75Qr8gJQ7QY5jeoZYU
 h39WymAZ/8InK4p76gglUkasvhr1D8VnRNvk3hPpGY+uIuTRTs/Z+S+MOPv4jkPbfV2aW9wIo3V
 LwQIE/knKoiIy8Ccn7l8d6BOgFYbpJufKLBgEkr4s/MUNH32Qa+0cyA==
X-Gm-Gg: AYBFou0y1EZKYJpUclEXk0pqhB/430dzZr3B//gQb1Kdn0lV+ADX955ZhNfN2gvBa/G
 bWFzd3BFmULEV1WO9gWMtuvUI+6K6pNBpytribiiHQfy9UPBoSy0egTDaBmVZRCwHUNz4K02Mis
 fg7OsnMt6JEPrzqhXa0tfQxg7ClGSGlhAPlQETdnl3MVHWD5mIDMzO3oy8u7XHxKYI1jAWEx9g6
 DRaoXoYOIS7/BVfTHqKUDLe9Dpbp3k3weGafNzcaxAWL+6Fd9itSW84XJZhaLqId9wK32STeqzZ
 wbiIeYbRH3QAfZC6VWQACGgWORqugCQUH96YrJebSAdawgKbW+t66h18WQgfy59wlUiC3chqkQ=
 =
X-Received: by 2002:a05:600c:a20a:b0:4a1:8849:17ae with SMTP id
 5b1f17b1804b1-4a1f4c4d361mr19444915e9.1.1792482215607; 
 Tue, 20 Oct 2026 00:43:35 -0700 (PDT)
X-Received: by 2002:a05:600c:a20a:b0:4a1:8849:17ae with SMTP id
 5b1f17b1804b1-4a1f4c4d361mr19444355e9.1.1792482215196; 
 Tue, 20 Oct 2026 00:43:35 -0700 (PDT)
Received: from [192.168.0.9] ([47.64.113.103])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e1d6db78csm4418281f8f.2.2026.10.20.00.43.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Oct 2026 00:43:34 -0700 (PDT)
Message-ID: <3412f9e1-1db8-4e6e-a4d0-e76876db157e@redhat.com>
Date: Tue, 20 Oct 2026 09:43:32 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/19] tests/guest-debug: convert cmd to an qemu_cmd
 array
To: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <th.huth+qemu@posteo.eu>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, Warner Losh <imp@bsdimp.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Kyle Evans <kevans@freebsd.org>, Keith Busch <kbusch@kernel.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Ani Sinha <anisinha@redhat.com>,
 Anders Roxell <anders.roxell@linaro.org>, qemu-arm@nongnu.org,
 Song Gao <gaosong@loongson.cn>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Brad Smith <brad@comstyle.com>, Brian Cain <brian.cain@oss.qualcomm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Yoshinori Sato <yoshinori.sato@nifty.com>, Klaus Jensen <its@irrelevant.dk>,
 John Snow <jsnow@redhat.com>
References: <20261019192704.3220373-1-alex.bennee@linaro.org>
 <20261019192704.3220373-10-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20261019192704.3220373-10-alex.bennee@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VEWik5vhWlBB-JAnkjJgUHkZq5gMQOPH578WNGL7jQk_1792482215
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.329,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 19/10/2026 21.26, Alex Bennée wrote:
> As with gdb_cmd passing a plain string to a subprocess involves making
> sure the escaping is correct so the underlying shell doesn't get
> confused. Do the same as gdb_cmd and make the whole thing an array.
> 
> There are a few minor wrinkles with when args.binary is expected so
> add some comments for that.
> 
> Suggested-by: Ilya Leoshkevich <iii@linux.ibm.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/guest-debug/run-test.py | 31 ++++++++++++++++++-------------
>   1 file changed, 18 insertions(+), 13 deletions(-)
Reviewed-by: Thomas Huth <thuth@redhat.com>


