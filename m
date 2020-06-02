Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp4211904lfc;
        Tue, 2 Jun 2020 09:13:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpkj7Yh5mgEvfycY4go3JT/8ooGZBdImVyVzHjiM5aBxxBvMTtVefrEZQrX8X2qI8u21rm
X-Received: by 2002:a25:af4a:: with SMTP id c10mr45766416ybj.270.1591114436518;
        Tue, 02 Jun 2020 09:13:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591114436; cv=none;
        d=google.com; s=arc-20160816;
        b=ha3DqcHzfCLObaUuAP/Ymn/hfsPhADP01nAlEAjl6Vfi3+F/Yb2AtgVR1j+VpVoXx3
         Qr7ZxXVQLq5uizSf6xQL6bq3gxxkgrb/Jk3B34kCT5Sv33kPEy5P/+gYkyGk925naG6f
         ZGiNc+BslMPNA+oOw4YvsFbS6XLO+/M5E7XuJJMngpSaHzNhOd8Ix0CwfVU5f1KpTweq
         tV8GGbcw4lxkspJbaYfKcPNGZHBkwIYM0NrPFlZhKAzOXmWaK2l3PIGeTKTiOQIqSbZn
         AI9NWezLHclaz+6kz/wWNRlDcjqHUnNGrl3WnyBxomIsXT25UW7gpUiwKenVkTUqi0GW
         +eQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nRjVumY39qoir6XsmnwnZ12NNGlR1Yj6Ipn5h/cM6es=;
        b=meA5G5LCBE8HEfm1pnHL0Ds6bVei1LvgIX5q4Cr/sG4bS9C5WVtveyUHIp4IJFm+AS
         nbWZWKvBd6uWS23/RtNwmBZF94kx6LgeRPQmr0TQfObuscnpqgBBqqVboUZEDAqgMMgo
         HNM173i1HUqIT+ruB0aJz5qSkwGCvrU+1HMlB0qh6R/yJGdOYpaT9G0hhhmgKCsNyB1r
         VIGeFRxzB/5Hwb2KUqFMevx/U35K66/qzLHbN05nZQbj6zknneiywYEPFcDNMR+ZQBmJ
         id3uGG5aUBZI6FyRAJ6hKj/o2FIzPf2x2v2G1ii5//UiO85BnsBOt1zdRtE4ZI7OgplO
         SzFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TKYFvQ1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z7si2457272ybp.399.2020.06.02.09.13.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 02 Jun 2020 09:13:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TKYFvQ1Y;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jg9Y3-0007Bm-Og
	for alex.bennee@linaro.org; Tue, 02 Jun 2020 12:13:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jg9Xw-0007BS-2Q
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 12:13:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:48486
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jg9Xu-0005FP-E7
 for qemu-arm@nongnu.org; Tue, 02 Jun 2020 12:13:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591114425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nRjVumY39qoir6XsmnwnZ12NNGlR1Yj6Ipn5h/cM6es=;
 b=TKYFvQ1Y7yZP/kbXsok3/HdP14agIsPjS9Mz43tblNkKviPJRTWsgA6+4lMq7srfFxtEh5
 1D5n8CADQimWooCUNcMDD5PSNenfhivuNRJ33QzYquWsIrnkwAfBqRbIqRREfAMOpIFm2Q
 B+zUhIiBiH5EVCPehvOemjxci4yaaws=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-buIskOu3OwedeXT0PCmr6g-1; Tue, 02 Jun 2020 12:13:38 -0400
X-MC-Unique: buIskOu3OwedeXT0PCmr6g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AF90AEC1A5;
 Tue,  2 Jun 2020 16:13:36 +0000 (UTC)
Received: from [10.36.113.56] (ovpn-113-56.ams2.redhat.com [10.36.113.56])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B6136C776;
 Tue,  2 Jun 2020 16:13:28 +0000 (UTC)
Subject: Re: [RFC 4/6] tests: tpm-emu: Remove assert on TPM2_ST_NO_SESSIONS
To: Stefan Berger <stefanb@linux.ibm.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 mst@redhat.com, shannon.zhaosl@gmail.com, imammedo@redhat.com
References: <20200601102113.1207-1-eric.auger@redhat.com>
 <20200601102113.1207-5-eric.auger@redhat.com>
 <50a54958-e9e0-c95f-3893-f7f790186e0e@linux.ibm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <80ce5833-90ee-cbc5-9822-cca1fabc33e6@redhat.com>
Date: Tue, 2 Jun 2020 18:13:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <50a54958-e9e0-c95f-3893-f7f790186e0e@linux.ibm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 22:14:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: marcandre.lureau@redhat.com, drjones@redhat.com, lersek@redhat.com,
 ardb@kernel.org, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dA8bLgP2MaZx

Hi Stefan,

On 6/2/20 3:39 PM, Stefan Berger wrote:
> On 6/1/20 6:21 AM, Eric Auger wrote:
>> While writing tests for checking the content of TPM2 and DSDT
>> along with TPM-TIS instantiation I attempted to reuse the
>> framework used for TPM-TIS tests. However While dumping the
>> ACPI tables I get an assert on TPM2_ST_NO_SESSIONS. My assumption
>> is maybe the other tests did not execute long enough to encounter
>> this. So I tentatively propose to remove the assert as it
>> does not seem to break other tests and enable the new ones.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   tests/qtest/tpm-emu.c | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/tests/qtest/tpm-emu.c b/tests/qtest/tpm-emu.c
>> index c43ac4aef8..298d0eec74 100644
>> --- a/tests/qtest/tpm-emu.c
>> +++ b/tests/qtest/tpm-emu.c
>> @@ -49,7 +49,6 @@ static void *tpm_emu_tpm_thread(void *data)
>>           s->tpm_msg->tag = be16_to_cpu(s->tpm_msg->tag);
>>           s->tpm_msg->len = be32_to_cpu(s->tpm_msg->len);
>>           g_assert_cmpint(s->tpm_msg->len, >=, minhlen);
>> -        g_assert_cmpint(s->tpm_msg->tag, ==, TPM2_ST_NO_SESSIONS);
> You should not have to remove this. The tests are skipped if swtpm does
> not support TPM 2 via --tpm2 option. This would be a very old swtpm
> version, though. So, all tests are run with --tpm2 option and any
> response received from the TPM would be a TPM 2 response that should
> have TPM2_ST_NO_SESSIONS as the tag. I'd be curious what other value you
> are seeing there.
If I revert this patch I am getting TPM2_ST_SESSIONS on my end.

Thanks

Eric
>>             s->tpm_msg = g_realloc(s->tpm_msg, s->tpm_msg->len);
>>           qio_channel_read(ioc, (char *)&s->tpm_msg->code,
> 
> 
> 

