Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3612747dye;
        Tue, 1 Jul 2025 23:27:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVPaWonGzBw8lhe8RipLjmkBxBri2kpae+qymumHjrWKd1MTZqhvQjwPCqFJ2JyoHqWal9y91Me9BlRsA==@linaro.org
X-Google-Smtp-Source: AGHT+IHcuEo9gJ0wLJoGz1KQYDR9LGL+Q2sZBuEy4fXzv6K8qBZ0S4tKkPyTNRV6L9gKcQiYWJ0M
X-Received: by 2002:a05:620a:6884:b0:7d0:97b1:bfa with SMTP id af79cd13be357-7d5c46687e2mr278544885a.8.1751437665683;
        Tue, 01 Jul 2025 23:27:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751437665; cv=none;
        d=google.com; s=arc-20240605;
        b=kkFXe6RY8fcKut2WtxFmcAnYQEhovq58e4eP1SgmIQxns4q+CHYX8YVfSh9oWDTKHi
         bH0/PhUa4zvu91E3CrHtNAWVX3K+nbCbUEV+n5NNASHb3YJOeHfQmmU9OxN6v2ZjUC8z
         uHuC3j3tjzMZ6m/ptr6hIz8xQNswkfTv4AtBbu0Ag0qUZEoXPSToq/D89V8f6YAGtgpp
         t/ITlNserAxu05ik8h9/YF4EQU6lFfz29p/l9y15hOzeJ//DsHbUI0W7gO4KTLduLcoP
         oUEJQGJR/hcRFCV+qaS8GA7C7Ky9TG+3fjl+Yu3Br4Dz/ZOG9pmzDOy089BkPHn50YaU
         rqMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=RqK4AeItUozJzy0m75Gwucf38QBsMOMp3fn+cxVBKqs=;
        fh=YBs/Yrtnjjuyc9+AoNjQTGao7X96hTLZZQq5knI7/1A=;
        b=ghmMFxdItcPGWekzJQ8VGnX/g6mrRxQg0LrNVmcW7mzb6+uTJl249hJXJbUHdvcXkb
         qDAi1TJVMIE2W9744QlOm9y628nMBr/3XC+b4YE/QdiiF4+PLRqzdvLM6jHaB3LjZ4Mv
         XP/ffb4N6hZ40l5eGOjOoKh0lXllUsC50J21cvUQtiUdKN7+JErYtlNCDrVnWmP9BQh7
         X7CtcqiTLGzHCNwedVBCGlFri0oJoIoVU2nFuQQ/9DBbXWrSIJHUFi8Wa4yruGHO/sX3
         zvxcX8/jVECQ6hthgxxlpwk1jNbOrWk5RF/woN3BHu9uAEt5GqcIhVoRitbuux9syfV6
         Pw5A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HlHdDakp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc23f5dbsi127932081cf.353.2025.07.01.23.27.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Jul 2025 23:27:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HlHdDakp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWqwD-000879-KJ; Wed, 02 Jul 2025 02:27:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uWqw9-00086i-AE
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 02:27:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1uWqw6-0001xy-Dk
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 02:27:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751437630;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=RqK4AeItUozJzy0m75Gwucf38QBsMOMp3fn+cxVBKqs=;
 b=HlHdDakpQMYXa1io/ajHeJj/JbneDTSSkgln4bnRbyOVdxIs5l13vdph4UHIHv/YbqXutk
 NRM3c6htkZ7wy7w2DlJJfLGdQrAwuEEdMwTC1y2c4z0li8dCTPGMeN4iQ0gtfqaBmXXgl6
 EqPoZiiZL+aGOWzpyjM8BNnY7Y5t2u0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-612-wqykW-kcOzuhvyP1exT2lQ-1; Wed, 02 Jul 2025 02:27:07 -0400
X-MC-Unique: wqykW-kcOzuhvyP1exT2lQ-1
X-Mimecast-MFC-AGG-ID: wqykW-kcOzuhvyP1exT2lQ_1751437626
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-451d30992bcso25899675e9.2
 for <qemu-arm@nongnu.org>; Tue, 01 Jul 2025 23:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751437626; x=1752042426;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RqK4AeItUozJzy0m75Gwucf38QBsMOMp3fn+cxVBKqs=;
 b=SnY/XMg/L0TFLWrnHH0x2nwm212f5F1qfV20HzlfjDFBPpw4jts5NsAA2MB6W61KtC
 rNRItJwnxuT3LZw4NwEA8rvRJF8tpj2fP2Z6rJldAFHcLu86ztdpfOysmH5iK0L0jJEz
 2d7NSfCXwYY47Q26pTaWi3FWPl9UoGjzpQg7cdbgYAraIvnmF+QdjvwMqnQ6GrzfcrF8
 mBAT5LrZhzsUXmTQ9pqVXPWJOcBCvAwKoLaL6bD/35yowiyuPjWt3d8GP0hgexjY8Wui
 tXgUYIR0OqnfYg5jPG+KnVwljb/tmkpK5FFEsk7eKW1R/Xq79tpHoaEJ9iWpznOnvuzM
 Fnyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmw5a+IPA6jmNThQ/fdlww2gHmCxzN0yRDAu7QvqO5x0dCOvh8nen5i2pmRbZ4s6clsYpvwpUvqA==@nongnu.org
X-Gm-Message-State: AOJu0YyEc+uxrb6AS8AT2qMe2Wf7SDYPW9B/ttB2kP9lbhmC7UUPhpvp
 0T3ky0GqiMu2dTOW2gnDzZoqSedDNRFzyhhThAYj2G/SSs0Rn19im7r10/zZH+lFbpACNxR6w4e
 GPVHTZgk+aRDHHZW80W9hJugXfsVy+DLnImxl/fyWJ5pL1JmjqxYubw==
X-Gm-Gg: ASbGncvN+CR7lnQIoV7zTAlNDzQPwY4zzkDrZzwLcPMrZvsHYCrvaJRZzLkEcvKKdo4
 SP1EHwbvPdBOXtksLiKL7XMU5iIb+ftmkuqUDQcmaxw705MoG26VzJ2fuxLgoxHdMDT+4yVwqU9
 LnmZ1bomxwR43H7m+NgYOtIYiQ97CUg6ocWnkvDR0rjaF5tcmgUu5ikCv3YBNvmSinMrExsZIVt
 dhR5mhoKW9sS6Hp3QvjSNqz7PHvvjfwOnFKJE6kmfY/R7ZqzyjRRQ1FgPrQtZ4Ue0wQatOTOBpK
 jOBTuZXJV7GO900Fz8+9g5potWwURooEVBDnKvYD5+DMvedhbJpUi7dNn2Wu
X-Received: by 2002:a05:600c:3d95:b0:43d:45a:8fbb with SMTP id
 5b1f17b1804b1-454a3704f96mr13482485e9.22.1751437626040; 
 Tue, 01 Jul 2025 23:27:06 -0700 (PDT)
X-Received: by 2002:a05:600c:3d95:b0:43d:45a:8fbb with SMTP id
 5b1f17b1804b1-454a3704f96mr13482295e9.22.1751437625590; 
 Tue, 01 Jul 2025 23:27:05 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:280:24f0:9db0:474c:ff43:9f5c?
 ([2a01:e0a:280:24f0:9db0:474c:ff43:9f5c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538a3a5b7fsm192046855e9.10.2025.07.01.23.27.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 23:27:04 -0700 (PDT)
Message-ID: <9bfa5e01-37a9-4e2a-bff5-264909e0dab9@redhat.com>
Date: Wed, 2 Jul 2025 08:27:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] vfio/migration: Add
 x-migration-load-config-after-iter VFIO property
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
 Alex Williamson <alex.williamson@redhat.com>, Peter Xu <peterx@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Eric Auger <eric.auger@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Avihai Horon <avihaih@nvidia.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <cover.1750787338.git.maciej.szmigiero@oracle.com>
 <22e94f25448f9ff42b84c84df3960c4ecc94cbdc.1750787338.git.maciej.szmigiero@oracle.com>
From: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>
Autocrypt: addr=clg@redhat.com; keydata=
 xsFNBFu8o3UBEADP+oJVJaWm5vzZa/iLgpBAuzxSmNYhURZH+guITvSySk30YWfLYGBWQgeo
 8NzNXBY3cH7JX3/a0jzmhDc0U61qFxVgrPqs1PQOjp7yRSFuDAnjtRqNvWkvlnRWLFq4+U5t
 yzYe4SFMjFb6Oc0xkQmaK2flmiJNnnxPttYwKBPd98WfXMmjwAv7QfwW+OL3VlTPADgzkcqj
 53bfZ4VblAQrq6Ctbtu7JuUGAxSIL3XqeQlAwwLTfFGrmpY7MroE7n9Rl+hy/kuIrb/TO8n0
 ZxYXvvhT7OmRKvbYuc5Jze6o7op/bJHlufY+AquYQ4dPxjPPVUT/DLiUYJ3oVBWFYNbzfOrV
 RxEwNuRbycttMiZWxgflsQoHF06q/2l4ttS3zsV4TDZudMq0TbCH/uJFPFsbHUN91qwwaN/+
 gy1j7o6aWMz+Ib3O9dK2M/j/O/Ube95mdCqN4N/uSnDlca3YDEWrV9jO1mUS/ndOkjxa34ia
 70FjwiSQAsyIwqbRO3CGmiOJqDa9qNvd2TJgAaS2WCw/TlBALjVQ7AyoPEoBPj31K74Wc4GS
 Rm+FSch32ei61yFu6ACdZ12i5Edt+To+hkElzjt6db/UgRUeKfzlMB7PodK7o8NBD8outJGS
 tsL2GRX24QvvBuusJdMiLGpNz3uqyqwzC5w0Fd34E6G94806fwARAQABzSJDw6lkcmljIExl
 IEdvYXRlciA8Y2xnQHJlZGhhdC5jb20+wsGRBBMBCAA7FiEEoPZlSPBIlev+awtgUaNDx8/7
 7KEFAmTLlVECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQUaNDx8/77KG0eg//
 S0zIzTcxkrwJ/9XgdcvVTnXLVF9V4/tZPfB7sCp8rpDCEseU6O0TkOVFoGWM39sEMiQBSvyY
 lHrP7p7E/JYQNNLh441MfaX8RJ5Ul3btluLapm8oHp/vbHKV2IhLcpNCfAqaQKdfk8yazYhh
 EdxTBlzxPcu+78uE5fF4wusmtutK0JG0sAgq0mHFZX7qKG6LIbdLdaQalZ8CCFMKUhLptW71
 xe+aNrn7hScBoOj2kTDRgf9CE7svmjGToJzUxgeh9mIkxAxTu7XU+8lmL28j2L5uNuDOq9vl
 hM30OT+pfHmyPLtLK8+GXfFDxjea5hZLF+2yolE/ATQFt9AmOmXC+YayrcO2ZvdnKExZS1o8
 VUKpZgRnkwMUUReaF/mTauRQGLuS4lDcI4DrARPyLGNbvYlpmJWnGRWCDguQ/LBPpbG7djoy
 k3NlvoeA757c4DgCzggViqLm0Bae320qEc6z9o0X0ePqSU2f7vcuWN49Uhox5kM5L86DzjEQ
 RHXndoJkeL8LmHx8DM+kx4aZt0zVfCHwmKTkSTQoAQakLpLte7tWXIio9ZKhUGPv/eHxXEoS
 0rOOAZ6np1U/xNR82QbF9qr9TrTVI3GtVe7Vxmff+qoSAxJiZQCo5kt0YlWwti2fFI4xvkOi
 V7lyhOA3+/3oRKpZYQ86Frlo61HU3r6d9wzOwU0EW7yjdQEQALyDNNMw/08/fsyWEWjfqVhW
 pOOrX2h+z4q0lOHkjxi/FRIRLfXeZjFfNQNLSoL8j1y2rQOs1j1g+NV3K5hrZYYcMs0xhmrZ
 KXAHjjDx7FW3sG3jcGjFW5Xk4olTrZwFsZVUcP8XZlArLmkAX3UyrrXEWPSBJCXxDIW1hzwp
 bV/nVbo/K9XBptT/wPd+RPiOTIIRptjypGY+S23HYBDND3mtfTz/uY0Jytaio9GETj+fFis6
 TxFjjbZNUxKpwftu/4RimZ7qL+uM1rG1lLWc9SPtFxRQ8uLvLOUFB1AqHixBcx7LIXSKZEFU
 CSLB2AE4wXQkJbApye48qnZ09zc929df5gU6hjgqV9Gk1rIfHxvTsYltA1jWalySEScmr0iS
 YBZjw8Nbd7SxeomAxzBv2l1Fk8fPzR7M616dtb3Z3HLjyvwAwxtfGD7VnvINPbzyibbe9c6g
 LxYCr23c2Ry0UfFXh6UKD83d5ybqnXrEJ5n/t1+TLGCYGzF2erVYGkQrReJe8Mld3iGVldB7
 JhuAU1+d88NS3aBpNF6TbGXqlXGF6Yua6n1cOY2Yb4lO/mDKgjXd3aviqlwVlodC8AwI0Sdu
 jWryzL5/AGEU2sIDQCHuv1QgzmKwhE58d475KdVX/3Vt5I9kTXpvEpfW18TjlFkdHGESM/Jx
 IqVsqvhAJkalABEBAAHCwV8EGAECAAkFAlu8o3UCGwwACgkQUaNDx8/77KEhwg//WqVopd5k
 8hQb9VVdk6RQOCTfo6wHhEqgjbXQGlaxKHoXywEQBi8eULbeMQf5l4+tHJWBxswQ93IHBQjK
 yKyNr4FXseUI5O20XVNYDJZUrhA4yn0e/Af0IX25d94HXQ5sMTWr1qlSK6Zu79lbH3R57w9j
 hQm9emQEp785ui3A5U2Lqp6nWYWXz0eUZ0Tad2zC71Gg9VazU9MXyWn749s0nXbVLcLS0yop
 s302Gf3ZmtgfXTX/W+M25hiVRRKCH88yr6it+OMJBUndQVAA/fE9hYom6t/zqA248j0QAV/p
 LHH3hSirE1mv+7jpQnhMvatrwUpeXrOiEw1nHzWCqOJUZ4SY+HmGFW0YirWV2mYKoaGO2YBU
 wYF7O9TI3GEEgRMBIRT98fHa0NPwtlTktVISl73LpgVscdW8yg9Gc82oe8FzU1uHjU8b10lU
 XOMHpqDDEV9//r4ZhkKZ9C4O+YZcTFu+mvAY3GlqivBNkmYsHYSlFsbxc37E1HpTEaSWsGfA
 HQoPn9qrDJgsgcbBVc1gkUT6hnxShKPp4PlsZVMNjvPAnr5TEBgHkk54HQRhhwcYv1T2QumQ
 izDiU6iOrUzBThaMhZO3i927SG2DwWDVzZltKrCMD1aMPvb3NU8FOYRhNmIFR3fcalYr+9gD
 uVKe8BVz4atMOoktmt0GWTOC8P4=
In-Reply-To: <22e94f25448f9ff42b84c84df3960c4ecc94cbdc.1750787338.git.maciej.szmigiero@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CRGINipQcHFELvNXW6Qd7KL1_ayjZo8nwgqmQvikoGI_1751437626
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: JnOb+QeFemLP

Adding more maintainers,

+Eric (ARM smmu),
+Peter (ARM, GIC, virt),

On 6/24/25 19:51, Maciej S. Szmigiero wrote:
> From: "Maciej S. Szmigiero" <maciej.szmigiero@oracle.com>
> 
> This property allows configuring whether to start the config load only
> after all iterables were loaded.
> Such interlocking is required for ARM64 due to this platform VFIO
> dependency on interrupt controller being loaded first.

Could you please a bit more ?
  
> The property defaults to AUTO, which means ON for ARM, OFF for other
> platforms.
> 
> Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

As we've mentioned a couple of times, this is essentially a workaround
to help ARM support a migration optimization (multifd) for guests using
passthrough PCI devices. At the moment, this mainly for MLX5 VFs
(upstream) and NVIDIA vGPUs (not upstream).

It looks like the issue is related to the ordering of the vmstate during
load time.

Is there a different way we could address this ? Other virt machines like
x86 and ppc also deal with complex interrupt controllers, and those cases
have been handled cleanly AFAICT. So what’s the fundamental issue here that
makes it necessary to add more complexity to an already complex feature
(multif VFIO migration) for what seems to be a corner case on a single
architecture ?

d329f5032e17 is the turning point.

Using 'strcmp(target_name(), "aarch64")' is quite unique in the QEMU code
base, and to be honest, I’m not too keen on adding it unless there’s really
no other option.

Thanks,

C.


> ---
>   docs/devel/migration/vfio.rst     |  6 +++
>   hw/core/machine.c                 |  1 +
>   hw/vfio/migration-multifd.c       | 88 +++++++++++++++++++++++++++++++
>   hw/vfio/migration-multifd.h       |  3 ++
>   hw/vfio/migration.c               | 10 +++-
>   hw/vfio/pci.c                     |  9 ++++
>   hw/vfio/vfio-migration-internal.h |  1 +
>   include/hw/vfio/vfio-device.h     |  1 +
>   8 files changed, 118 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/devel/migration/vfio.rst b/docs/devel/migration/vfio.rst
> index f4a6bfa4619b..7c9cb7bdbf87 100644
> --- a/docs/devel/migration/vfio.rst
> +++ b/docs/devel/migration/vfio.rst
> @@ -260,3 +260,9 @@ Because a malicious QEMU source causing OOM on the target is not expected to be
>   a realistic threat in most of VFIO live migration use cases and the right value
>   depends on the particular setup by default this queued buffers limit is
>   disabled by setting it to UINT64_MAX.
> +
> +Some host platforms (like ARM64) require that VFIO device config is loaded only
> +after all iterables were loaded.
> +Such interlocking is controlled by "x-migration-load-config-after-iter" VFIO
> +device property, which in its default setting (AUTO) does so only on platforms
> +that actually require it.
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index e869821b2246..16640b700f2e 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -39,6 +39,7 @@
>   
>   GlobalProperty hw_compat_10_0[] = {
>       { "scsi-hd", "dpofua", "off" },
> +    { "vfio-pci", "x-migration-load-config-after-iter", "off" },
>   };
>   const size_t hw_compat_10_0_len = G_N_ELEMENTS(hw_compat_10_0);
>   
> diff --git a/hw/vfio/migration-multifd.c b/hw/vfio/migration-multifd.c
> index f26c112090b4..a12ec1ead74a 100644
> --- a/hw/vfio/migration-multifd.c
> +++ b/hw/vfio/migration-multifd.c
> @@ -17,6 +17,7 @@
>   #include "qemu/error-report.h"
>   #include "qemu/lockable.h"
>   #include "qemu/main-loop.h"
> +#include "qemu/target-info.h"
>   #include "qemu/thread.h"
>   #include "io/channel-buffer.h"
>   #include "migration/qemu-file.h"
> @@ -35,6 +36,27 @@ typedef struct VFIODeviceStatePacket {
>       uint8_t data[0];
>   } QEMU_PACKED VFIODeviceStatePacket;
>   
> +bool vfio_load_config_after_iter(VFIODevice *vbasedev)
> +{
> +    if (vbasedev->migration_load_config_after_iter == ON_OFF_AUTO_ON) {
> +        return true;
> +    } else if (vbasedev->migration_load_config_after_iter == ON_OFF_AUTO_OFF) {
> +        return false;
> +    }
> +
> +    assert(vbasedev->migration_load_config_after_iter == ON_OFF_AUTO_AUTO);
> +
> +    /*
> +     * Starting the config load only after all iterables were loaded is required
> +     * for ARM64 due to this platform VFIO dependency on interrupt controller
> +     * being loaded first.
> +     *
> +     * See commit d329f5032e17 ("vfio: Move the saving of the config space to
> +     * the right place in VFIO migration").
> +     */
> +    return strcmp(target_name(), "aarch64") == 0;
> +}
> +
>   /* type safety */
>   typedef struct VFIOStateBuffers {
>       GArray *array;
> @@ -50,6 +72,9 @@ typedef struct VFIOMultifd {
>       bool load_bufs_thread_running;
>       bool load_bufs_thread_want_exit;
>   
> +    bool load_bufs_iter_done;
> +    QemuCond load_bufs_iter_done_cond;
> +
>       VFIOStateBuffers load_bufs;
>       QemuCond load_bufs_buffer_ready_cond;
>       QemuCond load_bufs_thread_finished_cond;
> @@ -409,6 +434,22 @@ static bool vfio_load_bufs_thread(void *opaque, bool *should_quit, Error **errp)
>           multifd->load_buf_idx++;
>       }
>   
> +    if (vfio_load_config_after_iter(vbasedev)) {
> +        while (!multifd->load_bufs_iter_done) {
> +            qemu_cond_wait(&multifd->load_bufs_iter_done_cond,
> +                           &multifd->load_bufs_mutex);
> +
> +            /*
> +             * Need to re-check cancellation immediately after wait in case
> +             * cond was signalled by vfio_load_cleanup_load_bufs_thread().
> +             */
> +            if (vfio_load_bufs_thread_want_exit(multifd, should_quit)) {
> +                error_setg(errp, "operation cancelled");
> +                goto thread_exit;
> +            }
> +        }
> +    }
> +
>       if (!vfio_load_bufs_thread_load_config(vbasedev, errp)) {
>           goto thread_exit;
>       }
> @@ -428,6 +469,48 @@ thread_exit:
>       return ret;
>   }
>   
> +int vfio_load_state_config_load_ready(VFIODevice *vbasedev)
> +{
> +    VFIOMigration *migration = vbasedev->migration;
> +    VFIOMultifd *multifd = migration->multifd;
> +    int ret = 0;
> +
> +    if (!vfio_multifd_transfer_enabled(vbasedev)) {
> +        error_report("%s: got DEV_CONFIG_LOAD_READY outside multifd transfer",
> +                     vbasedev->name);
> +        return -EINVAL;
> +    }
> +
> +    if (!vfio_load_config_after_iter(vbasedev)) {
> +        error_report("%s: got DEV_CONFIG_LOAD_READY but was disabled",
> +                     vbasedev->name);
> +        return -EINVAL;
> +    }
> +
> +    assert(multifd);
> +
> +    /* The lock order is load_bufs_mutex -> BQL so unlock BQL here first */
> +    bql_unlock();
> +    WITH_QEMU_LOCK_GUARD(&multifd->load_bufs_mutex) {
> +        if (multifd->load_bufs_iter_done) {
> +            /* Can't print error here as we're outside BQL */
> +            ret = -EINVAL;
> +            break;
> +        }
> +
> +        multifd->load_bufs_iter_done = true;
> +        qemu_cond_signal(&multifd->load_bufs_iter_done_cond);
> +    }
> +    bql_lock();
> +
> +    if (ret) {
> +        error_report("%s: duplicate DEV_CONFIG_LOAD_READY",
> +                     vbasedev->name);
> +    }
> +
> +    return ret;
> +}
> +
>   static VFIOMultifd *vfio_multifd_new(void)
>   {
>       VFIOMultifd *multifd = g_new(VFIOMultifd, 1);
> @@ -441,6 +524,9 @@ static VFIOMultifd *vfio_multifd_new(void)
>       multifd->load_buf_queued_pending_buffers = 0;
>       qemu_cond_init(&multifd->load_bufs_buffer_ready_cond);
>   
> +    multifd->load_bufs_iter_done = false;
> +    qemu_cond_init(&multifd->load_bufs_iter_done_cond);
> +
>       multifd->load_bufs_thread_running = false;
>       multifd->load_bufs_thread_want_exit = false;
>       qemu_cond_init(&multifd->load_bufs_thread_finished_cond);
> @@ -464,6 +550,7 @@ static void vfio_load_cleanup_load_bufs_thread(VFIOMultifd *multifd)
>               multifd->load_bufs_thread_want_exit = true;
>   
>               qemu_cond_signal(&multifd->load_bufs_buffer_ready_cond);
> +            qemu_cond_signal(&multifd->load_bufs_iter_done_cond);
>               qemu_cond_wait(&multifd->load_bufs_thread_finished_cond,
>                              &multifd->load_bufs_mutex);
>           }
> @@ -476,6 +563,7 @@ static void vfio_multifd_free(VFIOMultifd *multifd)
>       vfio_load_cleanup_load_bufs_thread(multifd);
>   
>       qemu_cond_destroy(&multifd->load_bufs_thread_finished_cond);
> +    qemu_cond_destroy(&multifd->load_bufs_iter_done_cond);
>       vfio_state_buffers_destroy(&multifd->load_bufs);
>       qemu_cond_destroy(&multifd->load_bufs_buffer_ready_cond);
>       qemu_mutex_destroy(&multifd->load_bufs_mutex);
> diff --git a/hw/vfio/migration-multifd.h b/hw/vfio/migration-multifd.h
> index 0bab63211d30..487f457282df 100644
> --- a/hw/vfio/migration-multifd.h
> +++ b/hw/vfio/migration-multifd.h
> @@ -20,9 +20,12 @@ void vfio_multifd_cleanup(VFIODevice *vbasedev);
>   bool vfio_multifd_transfer_supported(void);
>   bool vfio_multifd_transfer_enabled(VFIODevice *vbasedev);
>   
> +bool vfio_load_config_after_iter(VFIODevice *vbasedev);
>   bool vfio_multifd_load_state_buffer(void *opaque, char *data, size_t data_size,
>                                       Error **errp);
>   
> +int vfio_load_state_config_load_ready(VFIODevice *vbasedev);
> +
>   void vfio_multifd_emit_dummy_eos(VFIODevice *vbasedev, QEMUFile *f);
>   
>   bool
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index b76697bd1a23..7c6436d4c344 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -675,7 +675,11 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
>       int ret;
>   
>       if (vfio_multifd_transfer_enabled(vbasedev)) {
> -        vfio_multifd_emit_dummy_eos(vbasedev, f);
> +        if (vfio_load_config_after_iter(vbasedev)) {
> +            qemu_put_be64(f, VFIO_MIG_FLAG_DEV_CONFIG_LOAD_READY);
> +        } else {
> +            vfio_multifd_emit_dummy_eos(vbasedev, f);
> +        }
>           return;
>       }
>   
> @@ -784,6 +788,10 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
>   
>               return ret;
>           }
> +        case VFIO_MIG_FLAG_DEV_CONFIG_LOAD_READY:
> +        {
> +            return vfio_load_state_config_load_ready(vbasedev);
> +        }
>           default:
>               error_report("%s: Unknown tag 0x%"PRIx64, vbasedev->name, data);
>               return -EINVAL;
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 2765a39f9df1..01e48e39de75 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3524,6 +3524,9 @@ static const Property vfio_pci_dev_properties[] = {
>                   vbasedev.migration_multifd_transfer,
>                   vfio_pci_migration_multifd_transfer_prop, OnOffAuto,
>                   .set_default = true, .defval.i = ON_OFF_AUTO_AUTO),
> +    DEFINE_PROP_ON_OFF_AUTO("x-migration-load-config-after-iter", VFIOPCIDevice,
> +                            vbasedev.migration_load_config_after_iter,
> +                            ON_OFF_AUTO_AUTO),
>       DEFINE_PROP_UINT64("x-migration-max-queued-buffers", VFIOPCIDevice,
>                          vbasedev.migration_max_queued_buffers, UINT64_MAX),
>       DEFINE_PROP_BOOL("migration-events", VFIOPCIDevice,
> @@ -3700,6 +3703,12 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, const void *data)
>                                             "x-migration-multifd-transfer",
>                                             "Transfer this device state via "
>                                             "multifd channels when live migrating it");
> +    object_class_property_set_description(klass, /* 10.1 */
> +                                          "x-migration-load-config-after-iter",
> +                                          "Start the config load only after "
> +                                          "all iterables were loaded when doing "
> +                                          "live migration of device state via "
> +                                          "multifd channels");
>       object_class_property_set_description(klass, /* 10.1 */
>                                             "x-migration-max-queued-buffers",
>                                             "Maximum count of in-flight VFIO "
> diff --git a/hw/vfio/vfio-migration-internal.h b/hw/vfio/vfio-migration-internal.h
> index a8b456b239df..54141e27e6b2 100644
> --- a/hw/vfio/vfio-migration-internal.h
> +++ b/hw/vfio/vfio-migration-internal.h
> @@ -32,6 +32,7 @@
>   #define VFIO_MIG_FLAG_DEV_SETUP_STATE   (0xffffffffef100003ULL)
>   #define VFIO_MIG_FLAG_DEV_DATA_STATE    (0xffffffffef100004ULL)
>   #define VFIO_MIG_FLAG_DEV_INIT_DATA_SENT (0xffffffffef100005ULL)
> +#define VFIO_MIG_FLAG_DEV_CONFIG_LOAD_READY (0xffffffffef100006ULL)
>   
>   typedef struct VFIODevice VFIODevice;
>   typedef struct VFIOMultifd VFIOMultifd;
> diff --git a/include/hw/vfio/vfio-device.h b/include/hw/vfio/vfio-device.h
> index 0ee34aaf668b..359d553b916a 100644
> --- a/include/hw/vfio/vfio-device.h
> +++ b/include/hw/vfio/vfio-device.h
> @@ -66,6 +66,7 @@ typedef struct VFIODevice {
>       bool ram_block_discard_allowed;
>       OnOffAuto enable_migration;
>       OnOffAuto migration_multifd_transfer;
> +    OnOffAuto migration_load_config_after_iter;
>       uint64_t migration_max_queued_buffers;
>       bool migration_events;
>       bool use_region_fds;
> 

