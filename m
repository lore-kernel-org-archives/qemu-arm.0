Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp673321ejo;
        Mon, 11 Dec 2023 20:55:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGBnm20OtJaB9Xq7nqaH2DWYTILnhf47mE1HSfczvNkICNcA1U0oRrw3IrcDm8yXnayz6nl
X-Received: by 2002:a05:6214:5ca:b0:67a:a24d:e586 with SMTP id t10-20020a05621405ca00b0067aa24de586mr6680816qvz.46.1702356958940;
        Mon, 11 Dec 2023 20:55:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702356958; cv=none;
        d=google.com; s=arc-20160816;
        b=vI+zh9vJALeekedFGrTc13DdjZ3m3XgJ9IKpuDk+ZIFzLnfZWCZ4uPk7qYY+P5Omo8
         5pvQp2R88go2j0NKQ8I1XmWmZbrmvjbgaWZike08SIheG14mveBHR3pvT65IchQqNgqW
         0QViE+Yhffp6y+A7BB/eJjHnF7Ey6uOM56OOqHT9XDcx/4MTuA6B58kP7Be+TyO+G3Xm
         LLVTOiF6L4oEUII9WtdKQRi6VtZDioG+YwS61FuxJ4hERYneWc7Ja0MIF/SCWfhO7tRc
         KZ/9JrSLYjhFL6X0t1eS4EXHVWrgmK0Eh+imka2Nh5vcZ48biXxSKtXqNy9W3ZuVAvNz
         XhLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=gDEN6IBKCR9SZvy+vP5xMfqISLn2urgiBHY3S8b4Wt0=;
        fh=iuLTZZ1fjCI8LjSgJoBa8MYZ2BtgjMRkSSF1C0uH4/8=;
        b=npyhHDo0xviCh6/L7ArAcBYq1KT6H24PY13hALvi658d8ISnVesbiL5mLgcASeil7z
         y73RmsIyphzX/Wy5WTeil/EQKT+7Pjl4XfAIomiB2Q5GN0rZF3m2mu9lGJUcAc7bPAcj
         CnNJMEc2F5jy7Q8eGDg0MSxdjIZFBd/e8Bb3e8dAhvLupgqp6arCysAq0DXF4jYrrc10
         A/uSl7WvakPPvXNKjeHnA5ruZZluhLTH1P8UjljSqYvHFeVnrXrauIgrHeh88zfNAwIz
         NE8D7dLfIXHI+S5ptu2u1flqs1VupPbqt9tCioTOLhebGTnMLE0e9G8+ubXCLgu8ntOt
         Jr4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jJEkFs2P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h1-20020a05620a21c100b0077f41428fd4si8663623qka.714.2023.12.11.20.55.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Dec 2023 20:55:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jJEkFs2P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rCuo1-00079t-FX; Mon, 11 Dec 2023 23:55:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rCuny-00079d-Mf
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 23:55:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gshan@redhat.com>) id 1rCunk-0006Ni-VN
 for qemu-arm@nongnu.org; Mon, 11 Dec 2023 23:55:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702356922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gDEN6IBKCR9SZvy+vP5xMfqISLn2urgiBHY3S8b4Wt0=;
 b=jJEkFs2POJ/4DY8VJVoN57CDdlcNEBXtuIv7H35YExwp59P6yVq0a4J5gnFHqnUpu5Tvra
 q9s1615hO3zJ5CnvScwUoCM0frWgCPDyW14ACIPzwbob/6Cd3lMmd8gJoBSzIn6BYKaPn8
 YK2iz5iHUxH2V+GBn3ZsvGDi1NDEExo=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-614-VKd3JornPaKKonQt1cuNnQ-1; Mon, 11 Dec 2023 23:55:20 -0500
X-MC-Unique: VKd3JornPaKKonQt1cuNnQ-1
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-3b9f111c18dso5771815b6e.0
 for <qemu-arm@nongnu.org>; Mon, 11 Dec 2023 20:55:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702356919; x=1702961719;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gDEN6IBKCR9SZvy+vP5xMfqISLn2urgiBHY3S8b4Wt0=;
 b=HUNzZauNhUyRekcd0QqmELSRZVq62lgUBSp+KdimNbTM43FJYa/f98fg/GgVK/kgvh
 UMFNzmDAivGWRYCEdDkhTScsuVE7dzj3vjOteGW8TyI3nzQfkrgnmM8i+NyqA45e+Pgz
 4bCi2/jbBIZrO7VNjZvy+UMa0xN1rQA6tYKc/YibFBBACnJqpm///mvU4R/esxafsXdN
 ZveRon7CYPKoTaNiwJg142dyz+Q0fAlrzVYwtBH0rpfMq7qzsdMP+lUxl4ov2cytMakI
 zRmWoQo/20gVQ/7WeHgSLociadK2BBFfIV58tUAanTLI+jGZo+3vu+4M0Csx2L+Cud+Y
 JNwA==
X-Gm-Message-State: AOJu0YyXeN+d7XP9n+WH36JBQWQ+TIRAEgnllwgKcvHBj934IrKogddu
 inkU8J9k1Vd9whu8ynVtrNfLNAzrhKo9jw+lid9NwT5N6IfHFHk+DLbc0bzvTuKQdnMtiJ2BCQp
 AiyDlqVv2g0GSmrTkaMF4pHhgQ4kQCxsKfBCfA7qmfc7alP3O/PT8ksTo8cJ8iPiqpHfj
X-Received: by 2002:a05:6808:1493:b0:3b9:d4c0:5fac with SMTP id
 e19-20020a056808149300b003b9d4c05facmr7478809oiw.22.1702356919237; 
 Mon, 11 Dec 2023 20:55:19 -0800 (PST)
X-Received: by 2002:a05:6808:1493:b0:3b9:d4c0:5fac with SMTP id
 e19-20020a056808149300b003b9d4c05facmr7478776oiw.22.1702356918859; 
 Mon, 11 Dec 2023 20:55:18 -0800 (PST)
Received: from [192.168.68.51] ([43.252.115.3])
 by smtp.gmail.com with ESMTPSA id
 c23-20020aa78817000000b006ce358d5d9asm7417601pfo.141.2023.12.11.20.55.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Dec 2023 20:55:18 -0800 (PST)
Message-ID: <0b2aaedf-7a4c-49f4-b4af-71f9ab693207@redhat.com>
Date: Tue, 12 Dec 2023 14:55:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/9] Unified CPU type check
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, imammedo@redhat.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org,
 armbru@redhat.com, wangyanan55@huawei.com, vijai@behindbytes.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231204004726.483558-1-gshan@redhat.com>
In-Reply-To: <20231204004726.483558-1-gshan@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=gshan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: genoUm5mC/Xb

Hi Phil,

On 12/4/23 10:47, Gavin Shan wrote:
> This series bases on Phil's repository because the prepatory commits
> have been queued to the branch.
> 
>    https://gitlab.com/philmd/qemu.git (branch: cpus-next)
> 
> There are two places where the user specified CPU type is checked to see
> if it's supported or allowed by the board: machine_run_board_init() and
> mc->init(). We don't have to maintain two duplicate sets of logic. This
> series intends to move the check to machine_run_board_init() so that we
> have unified CPU type check.
> 
> This series can be checked out from:
> 
>    git@github.com:gwshan/qemu.git (branch: kvm/cpu-type)
> 
> PATCH[1-4] refactors and improves the logic to validate CPU type in
>             machine_run_board_init()
> PATCH[5-9] validates the CPU type in machine_run_board_init() for the
>             individual boards
> 
> v6: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg00768.html
> v7: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01045.html
> v8: https://lists.nongnu.org/archive/html/qemu-arm/2023-11/msg01168.html
> 

Ping to see if there is a chance to queue it up before the Chrismas? :)

Thanks,
Gavin

