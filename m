Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50167606A6EA
	for <qemu-arm@archiver.kernel.org>; Fri, 20 Nov 2026 20:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iUTiqlG/
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xUVVV-0000XK-RS; Fri, 20 Nov 2026 15:46:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xUVVJ-0000TB-1j
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 15:46:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1xUVVH-0000Zn-M8
 for qemu-arm@nongnu.org; Fri, 20 Nov 2026 15:46:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1795207598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=2WBlKHOTSaEI5dELonacKhr/R5x87miUpAzzKYSDf34=;
 b=iUTiqlG/UsMKg0KTOFQcSSvDQODGGH1jQv10V26vMAyA2Cds5L6wKTGPiOx/jo6WQiyq1l
 T5rvOcAmg3N54QIDrVvvkY5fnajA9XXqVE2V/h16pMSvHUk2QuKmfgWADsb8m48SqNzB/N
 luTfQxRIsxbzDSKyzaL9NCzb1nuZxyU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-_Kl8-KAAMliQwVrM1qoZ_Q-1; Fri, 20 Nov 2026 20:46:36 +0000
X-MC-Unique: _Kl8-KAAMliQwVrM1qoZ_Q-1
X-Mimecast-MFC-AGG-ID: _Kl8-KAAMliQwVrM1qoZ_Q_1795207592
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-490d2ac331bso1034195f8f.0
 for <qemu-arm@nongnu.org>; Fri, 20 Nov 2026 12:46:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795207592; x=1795812392;
 h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=2WBlKHOTSaEI5dELonacKhr/R5x87miUpAzzKYSDf34=;
 b=myObVdWlg2yjCnfmny6atHi5XJbBXr7jB6ygMmpG46Y2qiYJkiTNvUsSbvPIxiqPsZ
 GSrE2R8A+kNDc7UQ9gG8UeL9pcKCia5Wi/3thQUvqjmm7hudr1KDQT65TNFtGKWrNEBC
 Oqa+2GGA2SJ+PTdtysh4AufNICYzzgMmVC8JuD58vyCnrbc/EfBWt2EXHJZIZEn0kpba
 x1Br/XBzLz/rF7zFzmuwgeudy9aWPV21S4g9B+uk2S4O1gYhJztx6N+yanUVveglzd1U
 Xvi2rDaslwDgrRRxD6MHG5QT/yKggeWVCziT428rYWhvpfSLJtrFRfal5dn0NnJ20Koj
 Yp+g==
X-Forwarded-Encrypted: i=1;
 AL+hErHzIdT2jD+HtYL+NurPTYiwNLKnECjIzfXtwNBKJCvMDtwDyMIX4LHJ3FoWmibqraQUFTMkKEkFig==@nongnu.org
X-Gm-Message-State: APuU4Z/e+P3JJee4uGzxkKQxV6cQnZ0l0CGiXCbrxlWYmkVCte5b5dII
 P0FpoqrN66YLYPk9Kw8AIA/9gaiSN8d6XbJMoQigz2X4Pp8K4a0uyyIfku1Esw99/oIJ0nmSiHj
 cnoTDrdVDKz+hFOvu6vUTwIHtbThY8ZDTkmGz0UTJ3h5rPeEEcZoYAg==
X-Gm-Gg: AYBFou3eBlLrgNSjBuAAjaz+dg7rj4uNfIRv+vlSDvw4+lkVo0Mrq0q+swND46aFgGI
 QZqUXXc/pj+wke9HqQwNbv1e9fWlNA6EobjadRV5KTwan4FfE23Y8+B1mBFOWXHumHkkH7uXwKk
 xKvG8BzZm0YJ4XEy1lQAZdIZa7AXLi2nYsu932+7pEnR2xb6RwppYAv6hTIucevXNJ+wYv9KTlQ
 RM3WAQ2eSH+GgP5MYZk3aMPp4jOHKpEIsKKduiDZYol1VpAmFM4N8ibUYaSVgQmfmyd2BmBDiG+
 ieFOV72lNYXtBZaaNXnxeEsAkSoIOiBJDiwHksyB7g61vTrF9MtFw7U5pfC/AdbguV83+oI9ab5
 h78wMWyQ6bjvMqXcQa2DKEuTejQOe1YduFvt/P/A3tGR/
X-Received: by 2002:a05:600c:6749:b0:4bb:5f95:c014 with SMTP id
 5b1f17b1804b1-4bb8880f283mr101837575e9.19.1795207592665; 
 Fri, 20 Nov 2026 12:46:32 -0800 (PST)
X-Received: by 2002:a05:600c:6749:b0:4bb:5f95:c014 with SMTP id
 5b1f17b1804b1-4bb8880f283mr101837195e9.19.1795207592354; 
 Fri, 20 Nov 2026 12:46:32 -0800 (PST)
Received: from [192.168.0.9] ([47.65.243.90]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4ab6a67fe75sm8508504f8f.24.2026.11.20.12.46.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Nov 2026 12:46:31 -0800 (PST)
Message-ID: <442ca165-1609-4680-b9b1-81e7f6e64a7c@redhat.com>
Date: Fri, 20 Nov 2026 21:46:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] tests/functional: add Accept header when
 downloading assets
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>,
 Zhao Liu <zhao1.liu@intel.com>, Peter Maydell <peter.maydell@linaro.org>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@oss.qualcomm.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Christian Borntraeger <borntraeger@linux.ibm.com>, qemu-ppc@nongnu.org,
 Thomas Huth <th.huth+qemu@posteo.eu>, =?UTF-8?Q?Herv=C3=A9_Poussineau?=
 <hpoussin@reactos.org>, Eric Farman <farman@linux.ibm.com>
References: <20261120121458.3723625-1-berrange@redhat.com>
 <20261120121458.3723625-5-berrange@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20261120121458.3723625-5-berrange@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6LtJz9YpoSILtodKey_ETxlDqWSQeGBRIVmcb3DvV78_1795207592
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Am 20.11.26 um 13:14 schrieb Daniel P. Berrangé:
> elinux.org is currently triggering an Anubis challenge for requests
> to download assets. After comparing the headers that curl sends, it
> was narrowed down to the omission of an "Accept" header.
> 
> A missing "Accept" header is a rule that Anubis added a year ago
> which is known to hit python's urllib:
> 
>    https://github.com/TecharoHQ/anubis/issues/1346
> 
> the bug indicates the rule was removed by default at that time,
> however, rules have evolved further since then and look like they
> are hitting our downloads. Adding the header is simple & harmless.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/functional/qemu_test/asset.py | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
Reviewed-by: Thomas Huth <thuth@redhat.com>


