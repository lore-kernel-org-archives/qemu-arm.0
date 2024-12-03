Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp3569620njk;
        Tue, 3 Dec 2024 02:21:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXBGFTPFHqQegvs7Tpup+WyhzBPNGTaIaLxLVcaySRhdTyonIxA2pqI7TAtlrgnkbeGlPePzctVnmhmpg==@linaro.org
X-Google-Smtp-Source: AGHT+IEmrcM7gRVIOgF26en2uP9N7M7haabh6fI9FYTKqH1mKpPO2GClmai5R1CXTjklzH5iAdgd
X-Received: by 2002:a05:6214:2527:b0:6d8:95c9:af39 with SMTP id 6a1803df08f44-6d895c9b249mr199070536d6.0.1733221277886;
        Tue, 03 Dec 2024 02:21:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733221277; cv=none;
        d=google.com; s=arc-20240605;
        b=VpslQhHghYcWRi1SO95kjLpVs5sLNDh/+eQVf9FJrk6mjLjB0CK31wupoXPPNESqsj
         vC2i3fvks5qumUctWTqgvpH/tuGrDj3s67zXZetTnlBuWbIPXBKxW58hIQ0rrs3OSWlA
         P/+pDsaJqO7L7AGTviPdLz4bEGSaMSnX1V2nXN79rohWViCGyLZw0OcVWhj+lRWuj1w8
         KPuoobVHJKMoWm5b5sVL0kIfHKCCapHO063kkKTSYfgwy4ev9RZr8oPf9PKaIT6tyRCW
         qMScVEgf98SHeCSAp1G2kNvA+y7xueTgYmAYY/rlMmUEWukiDkh6d6SUd/JOkiYmOnLY
         Ge/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=YKWGDBbWazXWRRISTbTF1ZHM9e0Oj61kFvNUpJ5aQ5c=;
        fh=Q5ocldMDr4T2Il3sfa3iL+t77/kJDahTFG5iXQA2fO4=;
        b=FZs8ygH4gCoR6LWlteDW0OsVCnhHabzsp9G6tEx1R2FP9zTa463qu62gIpUgfhy7F8
         3sQIZgREBQX2arcDaxRUWmMLDwBs8kw7lT1Jwh+mAdiOj71kq9/n4GhnMZinpvTnNJyi
         Lqpsld+762TM6XfOSQz4++TaDBElIxHJSjfF/2w4OL1FLy9xvT0piDNtsFy/feAThD0K
         8gDN5sT4blLYsGWXS9zGafHlsnPyTwp3HN9TOXHywLId+8hILwBeLZhRsn6RqF4X+lZs
         7I2VSMZ7T6M2t+WQaqTaQXU0sK5bUOgiY8uvv36k/8plAnCNKBGlWM5z4I2QibuY+BsF
         ejZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CADZxIgj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d87545a1e2si153500116d6.298.2024.12.03.02.21.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Dec 2024 02:21:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CADZxIgj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIQ1X-0006YV-VZ; Tue, 03 Dec 2024 05:20:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tIQ1W-0006Xp-3W
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 05:20:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1tIQ1U-00014t-MY
 for qemu-arm@nongnu.org; Tue, 03 Dec 2024 05:20:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733221250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=YKWGDBbWazXWRRISTbTF1ZHM9e0Oj61kFvNUpJ5aQ5c=;
 b=CADZxIgjna0d3as1JXCmsXn46IyOnWm6LAMxtxB0yzzw36KSPIBXNExc8Bxn94/nH0FK0J
 fBx4RB2ys59Q3xtOsCJi1npXn5ccUhm5T07rTxNihpo09+A0lSFNDOf62FmqZ6pogQ549g
 LKEszuvOYK18AcjBw8CL8mZ7JSlvRnA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-IRm872QzP-imXdYDb7ljNA-1; Tue, 03 Dec 2024 05:20:48 -0500
X-MC-Unique: IRm872QzP-imXdYDb7ljNA-1
X-Mimecast-MFC-AGG-ID: IRm872QzP-imXdYDb7ljNA
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7b665521dabso899976285a.0
 for <qemu-arm@nongnu.org>; Tue, 03 Dec 2024 02:20:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733221248; x=1733826048;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YKWGDBbWazXWRRISTbTF1ZHM9e0Oj61kFvNUpJ5aQ5c=;
 b=W6aLLC7Quwe4urbgKe7fir0I4UIA1ifxk6T2zFpI8AFHPadRiHKZ5yQmbEuMrxUF8V
 ehYOyntgUIHrQn14fcBcDd50Ab7Tjk6uCA0tR6/qBWZh5i9eWs4AlQCO2rcigqCr2d07
 RDlKFQ7Qpk/U1Vj7A4kXXRX/h76Qpj1wKWHkUXVIQsvldNmP9JXs+cfau9xVSc+237eg
 LBRErY/c5IRSQc2LQhP7DnHrWtkTyNpMPA4Vh9sJhbIf0EvZPqNcrERlG6yzXZcp2czv
 MuXCUiX6FD0Kxx/LzZMZpVvVUP7DcGlpJDA2JZbWIA1/SKzPw6Y9qWY+Btcyyy7umQCV
 HBIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXdIk9gavBmsGrgpJ+xNwsI1cWUtooRu2nLbjJVihshNrzPcUP0vel5GYXX7GDAR78h1ofbyUdVQ==@nongnu.org
X-Gm-Message-State: AOJu0YxrvcSo+HCjZb6dsXzB8UBRpiyseksbypV7s6B6hD2pXjOWuahd
 k6/vVwlIU8eozEhJDqn9cieYt+gGVBqSysA3lVDM4eQm+pk9MZ9icCpYwCbzjoLltDZSmUYVV19
 vsyPN1AhotaPa1G+pW/sEzoSlKXS7KQCXAKDhHYZRrIhdsCYEHQ==
X-Gm-Gg: ASbGncuZDFdMHdqdiSWGOJbzE6MPYDS+p9avPChNmGSX5oesPX//GfrWrZRMz+fHdZ2
 8HRkrBLpyzM+U0fMs904LsUpbfqrGhI0oygyUXI1FDPcH0QdEdKaUuhUrgGr5PZtD2nNmfrXvZo
 BKcXeAWstj3pjU8mgSQ7mEByMon42j2qntXvu8IH0CawVrmMKVMiF1BlY7KmGrNgpJ2OynmqI/G
 50LOrUOt0S18kR8TZzkAOjZkVitjtHAvIWF3N3XQEjSuFJ1ER+Orj4dLKjRL2JPW99IWhuEosLQ
 HcLchA==
X-Received: by 2002:a05:620a:4622:b0:7b6:7030:5125 with SMTP id
 af79cd13be357-7b6a671c791mr271864885a.21.1733221248412; 
 Tue, 03 Dec 2024 02:20:48 -0800 (PST)
X-Received: by 2002:a05:620a:4622:b0:7b6:7030:5125 with SMTP id
 af79cd13be357-7b6a671c791mr271862685a.21.1733221248125; 
 Tue, 03 Dec 2024 02:20:48 -0800 (PST)
Received: from [192.168.0.7] (ip-109-42-51-199.web.vodafone.de.
 [109.42.51.199]) by smtp.gmail.com with ESMTPSA id
 af79cd13be357-7b684944f4asm496777385a.52.2024.12.03.02.20.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Dec 2024 02:20:47 -0800 (PST)
Message-ID: <94358073-193a-40f1-b625-8722a9de8b29@redhat.com>
Date: Tue, 3 Dec 2024 11:20:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] tests/functional/test_ppc64_hv: Remove legacy
 '-machine foo,accel=bar'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 xen-devel@lists.xenproject.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org
References: <20241203092153.60590-1-philmd@linaro.org>
 <20241203092153.60590-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20241203092153.60590-2-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: R_l7Iqj4h_m1lhOqw3Colx_ZCSNGMq2EamFMa4s3oNI_1733221248
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: O6VxpLDSHY6W

On 03/12/2024 10.21, Philippe Mathieu-Daudé wrote:
> Since commit 6f6e1698a68 ("vl: configure accelerators from -accel
> options") we prefer the '-accel bar' command line option.
> 
> Replace '-machine foo,accel=bar' -> '-machine foo -accel bar' in
> functional tests.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tests/functional/test_ppc64_hv.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/functional/test_ppc64_hv.py b/tests/functional/test_ppc64_hv.py
> index 312248bbfe4..536a433b993 100755
> --- a/tests/functional/test_ppc64_hv.py
> +++ b/tests/functional/test_ppc64_hv.py
> @@ -138,7 +138,8 @@ def do_test_kvm(self, hpt=False):
>           else:
>               append = ''
>           exec_command(self, 'qemu-system-ppc64 -nographic -smp 2 -m 1g '
> -                           '-machine pseries,x-vof=on,accel=kvm '
> +                           '-accel kvm '
> +                           '-machine pseries,x-vof=on '
>                              '-machine cap-cfpc=broken,cap-sbbc=broken,'
>                                       'cap-ibs=broken,cap-ccf-assist=off '
>                              '-drive file=/dev/nvme0n1,format=raw,readonly=on '

Reviewed-by: Thomas Huth <thuth@redhat.com>

