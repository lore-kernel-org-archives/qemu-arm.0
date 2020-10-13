Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2409532lfa;
        Tue, 13 Oct 2020 16:36:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6LC6BqL6FqAOuwUEhlfORsTl3JrBIOq0h/JmWVH+Kx5faPWolZrw+hC4Idf8ahpdYF8cb
X-Received: by 2002:a25:900b:: with SMTP id s11mr3475918ybl.468.1602632176364;
        Tue, 13 Oct 2020 16:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602632176; cv=none;
        d=google.com; s=arc-20160816;
        b=y1/IjlFQFXNm4d0vqw3jxCn3QVdz3fFPxmWNOuM5UmjIZDVPVJPyZTvTG2+fYCm1Bs
         UW5I5nMesDCcm2ReL8fvqsN7f+RYD2M7FMk0Ci/ufQKQpfmyPbLocAnWLvR+EbrZku2l
         CQup6VMpirKGIU0BQu4ViUNxfAklshgcVP/osJdLuMeIr0VCtw93w4JZLKS1Z0skg131
         ay4xoWjWQeYPkE8F9tXX0jZDRGNNU7MpdMUSmTOlF0cxq1Apax7D3RBz8X8rCB7xST1H
         UfMphXlV6PPLGNggyyLz4qiVMUkYeyCIDpEz2kQknrzDpP9lCryDbwXWcFIxE33iCrvh
         svsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=jazn452RSM1TEOWk31DmOc20UT+aIjpk6jMBELW6MNw=;
        b=n3fNp8kwAsk7/WTNtPz7B1JaEWVHNT+pLBDN29WvmxiyacHSub2NWlgMLCy+Y6keDa
         o+ec2qBoeFroYrtNVJ3u3Bqcx0rscilTV5/gsw3Adu4iXHvZqrOIG5o0lpsXfsb6G9DQ
         gDMdkcxwmGsICXYMUA9SeaicAkzP60+hn7W95tCtXts0e9vnNK4oYnn4tQ243FRzwxiL
         oGw6+wmLvszvoePdBU53G4MLUG5i7qhJVEbBOZHnRQGMRpWt7yRqPI/Z/1h7pE35BKev
         Nq5A+80SlLxTg0DL9Qm+mQCOM8QeozIaQk41Fps8v27qHmi7gus6VK/0KlBz3lRDDPit
         OsyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pajk3LOe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l16si1343003ybk.237.2020.10.13.16.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 16:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pajk3LOe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSTq3-00056S-PJ
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 19:36:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSTpf-00056B-Ta
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 19:35:51 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:38940)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSTpe-0006xh-A0
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 19:35:51 -0400
Received: by mail-pj1-x1044.google.com with SMTP id gv6so440343pjb.4
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 16:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jazn452RSM1TEOWk31DmOc20UT+aIjpk6jMBELW6MNw=;
 b=pajk3LOeujOzcnakiBlvrE6m46HjssN+2T9hlqgRpASyGm3PKa2ZEICAuq3VC6FjzT
 jXnz3w8pXtEEP4DWsIS2RpTY22ZB8MN3uJxbdQzMXW9A0XuC6zZwgBNXmdDjvOnvqPk9
 djK7Q93S0Am8K71wXI+2muTXgnC8Eq+z4xp31zmW39QvmgeRYOfH4aaIHdQCvUabO8G/
 DO3SdewDQv33o+waTSZUprQuOKihA0Cs0Ko9xaYA9WkeuviSNVto9CZWWxWMQTlrmMPF
 ROYqoBWPFt0VO4a6p/PeTEdrHXKqCo884UHH6unb4Gqem6RYHwUCBYcNuQQKh7WeenqA
 XHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jazn452RSM1TEOWk31DmOc20UT+aIjpk6jMBELW6MNw=;
 b=TJPUeaZSTjbruN1sLG8KKV+4q8ixfH+OAtAuAD4hB3CIBB/TxqZ4ZuvFL803Oq1OWH
 cB0rsmj/8lT+txSPW1AOTDCjMHFRjlAB9OqRhnRq9R2v+6WCM4UU841xFcngYAMIl9/6
 37hEPKpm3BFTGSfJ9Asybt/Z3UlbZ867N7i+NZfdo9ouUHfyTsC0DpO+/u1SxorT9eAG
 mwnITR2GtK808DH7wK5TZJzwIBt+CsX5tBQp27f/DV2kZzwXGbB1DBLKDNy5GcBDBkL9
 ddbCTbiERtYKLXpjZb9JermGb+QPQst0ahX2kM0QtRUYbQGZsS8kSsbzFvH3n/5PkW6m
 aYLg==
X-Gm-Message-State: AOAM5316REXlbF0JLt+mfezVhpkZ4P8x/37lUoIjrp/I7v/hi5uqlxTd
 zWxrI4FgfPu00a4wSM561cfk1g==
X-Received: by 2002:a17:902:8b89:b029:d2:4345:5dd with SMTP id
 ay9-20020a1709028b89b02900d2434505ddmr1820399plb.57.1602632148498; 
 Tue, 13 Oct 2020 16:35:48 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id x18sm825201pfj.90.2020.10.13.16.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 16:35:47 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] hw: Replace some magic by definitions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201012132017.3423954-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <63cb45ed-ba1f-2395-43c6-54fdc86cbd11@linaro.org>
Date: Tue, 13 Oct 2020 16:35:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012132017.3423954-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gMGklr3lxm8u

On 10/12/20 6:20 AM, Philippe Mathieu-Daudé wrote:
> Philippe Mathieu-Daudé (5):
>   hw: Replace magic value by PCI_NUM_PINS definition
>   hw/pci-host/pam: Use ARRAY_SIZE() instead of magic value
>   hw/pci-host/versatile: Add the MEMORY_WINDOW_COUNT definition
>   hw/pci-host/versatile: Add the PCI_BAR_COUNT definition
>   tests/qtest: Replace magic value by NANOSECONDS_PER_SECOND definition

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
