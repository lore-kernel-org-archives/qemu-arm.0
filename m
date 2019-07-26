Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp11931681wrv;
        Fri, 26 Jul 2019 06:43:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz1nU0TiMzp3OO6Jozyq2wEGjV4mdWreCXZpjrGmOHQxX4UEXZn4ySRF14bVMqmq502KvXo
X-Received: by 2002:a17:906:3e88:: with SMTP id a8mr72147295ejj.206.1564148597207;
        Fri, 26 Jul 2019 06:43:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564148597; cv=none;
        d=google.com; s=arc-20160816;
        b=aJXX9e6rV5g62Iom7UawPm1j8xE6UEBwA1jfrReFxKvge+sA1swqAu6su24S2Gbbxt
         gqkIs82aBmjNo2z2qo1WyUDH3vRlFrse2j1zoQVTCcBjoP0whkNXo0OxqHOhWnAvFcI/
         sxQgL57G0Lo9K4hvI+YLjo/58gNjlQijLFwGBa5qcr7gr1YLDIrOgsLCpN5DWXf/GyJq
         PacglxwE595nW+BTpBpu6pAfTA/APlwWmOYT54GNM3opN3YB0R4YLGmH4KVtiDq/ebU9
         M9ssELdPMyiZ0HiKLvA0uKI14awQzy3T1QhfFvzpK4/Eshk3FC38pe6AR8o0OLxon4uE
         RofQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=AmS7UDuS3zEcCE4IUO/TDmWCbBzA+qKCEdMP7YkyQYw=;
        b=zlJZFZOTfPTCT8JuJBpgTFK/bS6Bxc9Z/SjhTVsYspltYlDdeYcdfKesqjQPvpIyzk
         MRBnyePKcnZcz7r9/CefZu1JPb+6gnBUg5+3Hj70saiXGo8kxKtIEfeCaAZ1oH7RDH+A
         BQBD+EEl1XqxwGcxmvvhj6o0YKOC186y2iPjJB7bbKYrDHPax1Fphq/juJ05v2ftsj5O
         BjOokjIlZAtLJd8DKPPmTV+EpT+cKpTB6SxklaFWLNHz3OjWhiiqOcNij69IJ+spFxAx
         2PECpovwwl1o4IS27ZGmprdJs/7jJqbGQfC1XhHkdjFteTOmexr7++ivZTREjdP5FzOL
         48uw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cXcheX8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id qc1si10984138ejb.59.2019.07.26.06.43.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jul 2019 06:43:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cXcheX8C;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hr0VA-0000O0-2k
	for alex.bennee@linaro.org; Fri, 26 Jul 2019 09:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40570)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0V6-0000MC-NS
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:43:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hr0V5-0006wC-PT
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:43:12 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:35591)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hr0V5-0006uB-IX
 for qemu-arm@nongnu.org; Fri, 26 Jul 2019 09:43:11 -0400
Received: by mail-pg1-x541.google.com with SMTP id s1so18513679pgr.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jul 2019 06:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=AmS7UDuS3zEcCE4IUO/TDmWCbBzA+qKCEdMP7YkyQYw=;
 b=cXcheX8CHjDS73QfCxqveu+PZaEoxZziSuO7L8ZSY+BUBL9HL+0e8rEixQ2/gaS6H+
 UAVhuzF1bOLgX6fKEl2c3ae3yLXbZWoDIkvKX367vLmjhRq7AboyK2uuEFMzDQfgaWcq
 I5PnWijEVMM/Dh9TKmziKmtXN92X+T8i/nGfh8K8GCXpllbZD4PVykSBXzIzJ9eSTlfm
 ZfCt79n9I7G0Eq55f/TOnSujCiBUhul1/fyHTCYeoNTJB4jf+ph1MsOFW6+Cj9qBlKR1
 vlU/GhNRnpd2NUqQRXcQuEUMxiICXVXxA/Ca9YjtPzb9d+SJ+clmVVj2mT30uacHSuZQ
 jnSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=AmS7UDuS3zEcCE4IUO/TDmWCbBzA+qKCEdMP7YkyQYw=;
 b=CasOx9iJ79nGzcS4KsiEHmp7OBwfkKh2YQKvZAyLXEAAKw1Olpxo4v7Sqb0HXOOaDB
 ZGnrHjzb3wb3Kd7JPRRHxWK4v6psfUWcw+D2Wnno3vH7k4Wq+9IlYTtx4poakknNXW6g
 0OytesPXCTL/++BD7MICHe5I61y9PwjWSZziJa953DP5DzFjvPUX0aIpWEQSwkG5DDAD
 cfKnYz3w5O4Toq/DkwHN38mOaiczlDgUeqDk3n9403W8vqBc/dtXvmqYL2q0E/HCXfEQ
 6DZJqtOX1zNkDp58TgU4r04dUR8G4V5XXx4pp3jPjuHFJMrG4gmyyx8gCUfmFaSYvY5w
 5lUg==
X-Gm-Message-State: APjAAAVLekoJzKjlYgLUTcvzVKvrSSGcgwoYOS3zY2QsD9MhLh1naQas
 gJ6A9oYC0PMHpPYMJIef4Q03ww==
X-Received: by 2002:a65:5c4b:: with SMTP id v11mr48696434pgr.62.1564148590262; 
 Fri, 26 Jul 2019 06:43:10 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id v184sm49410033pgd.34.2019.07.26.06.43.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 26 Jul 2019 06:43:09 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <3106a3c959c4498fad13a5799c89ba7b@tpw09926dag18e.domain1.systemhost.net>
 <1564123519581.61197@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5105ad51-98c5-ec01-b869-c32f69ec0e6f@linaro.org>
Date: Fri, 26 Jul 2019 06:43:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1564123519581.61197@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v5 05/15] hw/intc/armv7m_nic:
 Access MemoryRegion with MemOp
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
Cc: peter.maydell@linaro.org, walling@linux.ibm.com, sagark@eecs.berkeley.edu,
 mst@redhat.com, palmer@sifive.com, mark.cave-ayland@ilande.co.uk,
 Alistair.Francis@wdc.com, alex.williamson@redhat.com, arikalo@wavecomp.com,
 david@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com, rth@twiddle.net,
 atar4qemu@gmail.com, ehabkost@redhat.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, shorne@gmail.com,
 david@gibson.dropbear.id.au, qemu-riscv@nongnu.org,
 kbastian@mail.uni-paderborn.de, cohuck@redhat.com, laurent@vivier.eu,
 qemu-ppc@nongnu.org, amarkovic@wavecomp.com, pbonzini@redhat.com,
 aurelien@aurel32.net
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aym3Qvsbl07P

On 7/25/19 11:45 PM, tony.nguyen@bt.com wrote:
> No-op SIZE_MEMOP macro allows us to later easily convert
> memory_region_dispatch_{read|write} paramter "unsigned size" into a
> size+sign+endianness encoded "MemOp op".
> 
> Being a no-op macro, this patch does not introduce any logical change.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/intc/armv7m_nvic.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
