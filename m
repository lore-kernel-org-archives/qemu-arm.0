Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp413242njb;
        Tue, 13 May 2025 03:19:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU4Sic3dxCg70iEmievIl/m0EjOPLVbHWrbT1Dc1WsChLYkbMldS4y53luORHBfTRBTXMlzu6IebcqBNQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF3X8aL/Sf+eQU2DXnGH3KFoAwZnJ6/JllveE1xytKL9Tao8iFtNMKIRR11nt1VmHU9ihRr
X-Received: by 2002:a05:622a:2c3:b0:476:95dd:520e with SMTP id d75a77b69052e-49452742128mr261856401cf.16.1747131592774;
        Tue, 13 May 2025 03:19:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747131592; cv=none;
        d=google.com; s=arc-20240605;
        b=NfSwx2RCnWwci2rpO0e9OsSb9ITmVZd9a/nyKcx5Ye0y/T9yJQhOp1j8HHvAJkNjAD
         JAs6xHm6cfdxnWEKjyg7pBkyAuC8uwxSGy8PBjuFcOSqJ6qgMcbhuxi5vX1x/bv7cR3/
         1kqXhbsrV8l5MTVUBXvRpgvYu3j1JX3pvQAyjz5/YddM0X3sPjj389pMsOjnIVi5lv4V
         Y4AxkrgqSQN8XjYZjisd5bdJsNQakKrIE9ZujEC+eRN3riNelmApuXjYbTotlos/o1aT
         p/VzyQ/UowuSMyhmwq+Z437+F+5QZ+9GGb3aKVMIVtAj15RqkyOZOlTX3D5fgMKhY+oC
         mYxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:autocrypt:from:references:cc:to
         :subject:user-agent:mime-version:date:message-id:dkim-signature;
        bh=cRFVwNL/q1APjBkV0o0pxCp932asVyl0IyTJ08vI01U=;
        fh=D8MXsp1x3LODr1VyFDnkUCz+3h5HMWXoE2VOJVd2wGI=;
        b=UiU+y/QLawAlcPl5oMD1DBv80UdlbB0bUuIqTiD11E4nfCUjfUoWu+a69Kwl7YSZQa
         FPASbBTDuwE6c1PM9OnauzmDNZic7lRHqVkSkEunqTWbX9bQIA2r6jrlgweYiX9nFgwJ
         cwz1J3aalk5pKCiWtzrlXFk6ut8HlcQGrUgKomhSBQQIlYQh0y3ldmcLEVVKsio4snCb
         3KPqdutQOTV91VeEa3I5xptslz7culFFDnEh0cvm8wCGDGMENPWI0nkSjY3+1vKWnK5N
         QkughJw32py1ouhQf9rQWUHsLcPe6a3ssPeFIkVyq0LoEjmwf5cFRYBS09thU0M5LbyZ
         NItw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MesK5L/c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-49452479846si113215231cf.159.2025.05.13.03.19.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 03:19:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="MesK5L/c";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEmjg-00019T-Gg; Tue, 13 May 2025 06:19:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1uEmjd-00018s-J2
 for qemu-arm@nongnu.org; Tue, 13 May 2025 06:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1uEmjb-0000YX-4k
 for qemu-arm@nongnu.org; Tue, 13 May 2025 06:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747131578;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=cRFVwNL/q1APjBkV0o0pxCp932asVyl0IyTJ08vI01U=;
 b=MesK5L/csd0KRWcvhDQ3nPyIvDK8+WebyXXLHg+5to4EhyyPqneb46vmDmngZSAfZe2CVt
 DjFjbKk9zHvG0+N7ujtzm7i8DDz6z/QshoAnZ/HCP2FTHuSw6Rhh4JzK/j0q77vmVj9NUC
 wfySxB7mLLrdW4mZa7bOYG3ctUUoOVc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-bj1TBxa9OaOJB4xgtW_LKw-1; Tue, 13 May 2025 06:19:35 -0400
X-MC-Unique: bj1TBxa9OaOJB4xgtW_LKw-1
X-Mimecast-MFC-AGG-ID: bj1TBxa9OaOJB4xgtW_LKw_1747131574
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-43cf3168b87so23927895e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 03:19:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747131574; x=1747736374;
 h=content-transfer-encoding:in-reply-to:autocrypt:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cRFVwNL/q1APjBkV0o0pxCp932asVyl0IyTJ08vI01U=;
 b=cD+dZaNRG5trXYDDzfYFDRsDnVHHih/ezHxAop8QPVHfYGDPlnTcTlvVrZwJ0YJqMD
 Gr3BegUXRoJUUSRp+ltMYF+G7j5x4UDgGt4PEtjRHJyYu+ack/COMak7qHgtaPkJnA9O
 8IWnV5/PAFaARiVpJe4jbh/JjDO0ZGFRpJIAWiks6p0/J9WIaFSE36iarzZCc+9jx9sf
 zodvyN72enlkTwSETxAg8U9PVgqesTwCFmo2iRcLNybBhAdt14grunGqjIEaB6GgYhyt
 7O661fzzlnyHFZcXllNgVto/EKc/KtwLymZ5seLgThCYs+dcoHAnD4HA+MRT6LKk6Hz2
 Osqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDSiz6f8jAzxF8o9YeDPWQ0rSiingTO8xZ4jOYUOqne/Mv6h8RcrzUMg9eJU7iyXK+TjU+OAtq2Q==@nongnu.org
X-Gm-Message-State: AOJu0YwAHVlJ3c1p8zFNUSFeUK/0zSlh+vOEhudTdqkypFFqPXSlk8vS
 1JpnybuzSCGFfUKm+zXfRTpUOurVKz3sYUNuZMVQ0lmuGSTcAC4korndjYlA1+y6H4qJO8ZYFUJ
 UZqukNOuaNAdZ2EOp7bJ8uYKZRlP59rwbGhihau4jIvomTtUXdQ==
X-Gm-Gg: ASbGncuSujkJCFpxMOC4T5QDz+3rY1+62tRxSE45Z8biQ80D61uj7sS0FcX6v9e8Ddp
 5xClgPuiPxfPH024+idC4/gw8+cbSBbof0dE1DH5lmVdSoIMVKhJDGDEANEkIgx6wM2XLbJ0tm9
 K+WxBTrpYVsmbm9gC5wggPODkg0TiKhFkCgJA0efn9nrYpM0vBVW6W8vxn+LKdGjJqDyAIeyGhY
 gw5wskvtpKPtDAnOQcCYaSvRE1nSSwZYDAma7eEeqz80DFfCo/wrxCrHwL7KNTpK5V5CELASW1W
 8lCsbmh+nolbL8QASMTJyLl+ZeXVddQH/Ptyr07CcqdDGpnvCQ==
X-Received: by 2002:a05:600c:528e:b0:43d:7413:cb3e with SMTP id
 5b1f17b1804b1-442d6d17f7cmr124318005e9.1.1747131574442; 
 Tue, 13 May 2025 03:19:34 -0700 (PDT)
X-Received: by 2002:a05:600c:528e:b0:43d:7413:cb3e with SMTP id
 5b1f17b1804b1-442d6d17f7cmr124317655e9.1.1747131574054; 
 Tue, 13 May 2025 03:19:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e10:ef90:343a:68f:2e91:95c?
 ([2a01:e0a:e10:ef90:343a:68f:2e91:95c])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442e9f1d1bbsm41332385e9.25.2025.05.13.03.19.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 03:19:33 -0700 (PDT)
Message-ID: <cf58909d-f0cd-453f-baf6-898139cc8bd5@redhat.com>
Date: Tue, 13 May 2025 12:19:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests/qtest/aspeed_smc-test: Fix memory leaks
To: Jamin Lin <jamin_lin@aspeedtech.com>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, Troy Lee <leetroy@gmail.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Joel Stanley <joel@jms.id.au>,
 Fabiano Rosas <farosas@suse.de>, Paolo Bonzini <pbonzini@redhat.com>,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Cc: troy_lee@aspeedtech.com
References: <20250513080806.1005996-1-jamin_lin@aspeedtech.com>
From: Laurent Vivier <lvivier@redhat.com>
Autocrypt: addr=lvivier@redhat.com; keydata=
 xsFNBFYFJhkBEAC2me7w2+RizYOKZM+vZCx69GTewOwqzHrrHSG07MUAxJ6AY29/+HYf6EY2
 WoeuLWDmXE7A3oJoIsRecD6BXHTb0OYS20lS608anr3B0xn5g0BX7es9Mw+hV/pL+63EOCVm
 SUVTEQwbGQN62guOKnJJJfphbbv82glIC/Ei4Ky8BwZkUuXd7d5NFJKC9/GDrbWdj75cDNQx
 UZ9XXbXEKY9MHX83Uy7JFoiFDMOVHn55HnncflUncO0zDzY7CxFeQFwYRbsCXOUL9yBtqLer
 Ky8/yjBskIlNrp0uQSt9LMoMsdSjYLYhvk1StsNPg74+s4u0Q6z45+l8RAsgLw5OLtTa+ePM
 JyS7OIGNYxAX6eZk1+91a6tnqfyPcMbduxyBaYXn94HUG162BeuyBkbNoIDkB7pCByed1A7q
 q9/FbuTDwgVGVLYthYSfTtN0Y60OgNkWCMtFwKxRaXt1WFA5ceqinN/XkgA+vf2Ch72zBkJL
 RBIhfOPFv5f2Hkkj0MvsUXpOWaOjatiu0fpPo6Hw14UEpywke1zN4NKubApQOlNKZZC4hu6/
 8pv2t4HRi7s0K88jQYBRPObjrN5+owtI51xMaYzvPitHQ2053LmgsOdN9EKOqZeHAYG2SmRW
 LOxYWKX14YkZI5j/TXfKlTpwSMvXho+efN4kgFvFmP6WT+tPnwARAQABzSNMYXVyZW50IFZp
 dmllciA8bHZpdmllckByZWRoYXQuY29tPsLBeAQTAQIAIgUCVgVQgAIbAwYLCQgHAwIGFQgC
 CQoLBBYCAwECHgECF4AACgkQ8ww4vT8vvjwpgg//fSGy0Rs/t8cPFuzoY1cex4limJQfReLr
 SJXCANg9NOWy/bFK5wunj+h/RCFxIFhZcyXveurkBwYikDPUrBoBRoOJY/BHK0iZo7/WQkur
 6H5losVZtrotmKOGnP/lJYZ3H6OWvXzdz8LL5hb3TvGOP68K8Bn8UsIaZJoeiKhaNR0sOJyI
 YYbgFQPWMHfVwHD/U+/gqRhD7apVysxv5by/pKDln1I5v0cRRH6hd8M8oXgKhF2+rAOL7gvh
 jEHSSWKUlMjC7YwwjSZmUkL+TQyE18e2XBk85X8Da3FznrLiHZFHQ/NzETYxRjnOzD7/kOVy
 gKD/o7asyWQVU65mh/ECrtjfhtCBSYmIIVkopoLaVJ/kEbVJQegT2P6NgERC/31kmTF69vn8
 uQyW11Hk8tyubicByL3/XVBrq4jZdJW3cePNJbTNaT0d/bjMg5zCWHbMErUib2Nellnbg6bc
 2HLDe0NLVPuRZhHUHM9hO/JNnHfvgiRQDh6loNOUnm9Iw2YiVgZNnT4soUehMZ7au8PwSl4I
 KYE4ulJ8RRiydN7fES3IZWmOPlyskp1QMQBD/w16o+lEtY6HSFEzsK3o0vuBRBVp2WKnssVH
 qeeV01ZHw0bvWKjxVNOksP98eJfWLfV9l9e7s6TaAeySKRRubtJ+21PRuYAxKsaueBfUE7ZT
 7zfOwU0EVgUmGQEQALxSQRbl/QOnmssVDxWhHM5TGxl7oLNJms2zmBpcmlrIsn8nNz0rRyxT
 460k2niaTwowSRK8KWVDeAW6ZAaWiYjLlTunoKwvF8vP3JyWpBz0diTxL5o+xpvy/Q6YU3BN
 efdq8Vy3rFsxgW7mMSrI/CxJ667y8ot5DVugeS2NyHfmZlPGE0Nsy7hlebS4liisXOrN3jFz
 asKyUws3VXek4V65lHwB23BVzsnFMn/bw/rPliqXGcwl8CoJu8dSyrCcd1Ibs0/Inq9S9+t0
 VmWiQWfQkz4rvEeTQkp/VfgZ6z98JRW7S6l6eophoWs0/ZyRfOm+QVSqRfFZdxdP2PlGeIFM
 C3fXJgygXJkFPyWkVElr76JTbtSHsGWbt6xUlYHKXWo+xf9WgtLeby3cfSkEchACrxDrQpj+
 Jt/JFP+q997dybkyZ5IoHWuPkn7uZGBrKIHmBunTco1+cKSuRiSCYpBIXZMHCzPgVDjk4viP
 brV9NwRkmaOxVvye0vctJeWvJ6KA7NoAURplIGCqkCRwg0MmLrfoZnK/gRqVJ/f6adhU1oo6
 z4p2/z3PemA0C0ANatgHgBb90cd16AUxpdEQmOCmdNnNJF/3Zt3inzF+NFzHoM5Vwq6rc1JP
 jfC3oqRLJzqAEHBDjQFlqNR3IFCIAo4SYQRBdAHBCzkM4rWyRhuVABEBAAHCwV8EGAECAAkF
 AlYFJhkCGwwACgkQ8ww4vT8vvjwg9w//VQrcnVg3TsjEybxDEUBm8dBmnKqcnTBFmxN5FFtI
 WlEuY8+YMiWRykd8Ln9RJ/98/ghABHz9TN8TRo2b6WimV64FmlVn17Ri6FgFU3xNt9TTEChq
 AcNg88eYryKsYpFwegGpwUlaUaaGh1m9OrTzcQy+klVfZWaVJ9Nw0keoGRGb8j4XjVpL8+2x
 OhXKrM1fzzb8JtAuSbuzZSQPDwQEI5CKKxp7zf76J21YeRrEW4WDznPyVcDTa+tz++q2S/Bp
 P4W98bXCBIuQgs2m+OflERv5c3Ojldp04/S4NEjXEYRWdiCxN7ca5iPml5gLtuvhJMSy36gl
 U6IW9kn30IWuSoBpTkgV7rLUEhh9Ms82VWW/h2TxL8enfx40PrfbDtWwqRID3WY8jLrjKfTd
 R3LW8BnUDNkG+c4FzvvGUs8AvuqxxyHbXAfDx9o/jXfPHVRmJVhSmd+hC3mcQ+4iX5bBPBPM
 oDqSoLt5w9GoQQ6gDVP2ZjTWqwSRMLzNr37rJjZ1pt0DCMMTbiYIUcrhX8eveCJtY7NGWNyx
 FCRkhxRuGcpwPmRVDwOl39MB3iTsRighiMnijkbLXiKoJ5CDVvX5yicNqYJPKh5MFXN1bvsB
 kmYiStMRbrD0HoY1kx5/VozBtc70OU0EB8Wrv9hZD+Ofp0T3KOr1RUHvCZoLURfFhSQ=
In-Reply-To: <20250513080806.1005996-1-jamin_lin@aspeedtech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: eGQCq70gR8cW4zO4Q_Fc_J-MduoUGLdicybDGL0s6wA_1747131574
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: v6xrkrwTHIxW

On 13/05/2025 10:08, Jamin Lin wrote:
> Link: https://patchwork.kernel.org/project/qemu-devel/patch/20250509175047.26066-1-farosas@suse.de/
> 
> Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> ---
>   tests/qtest/aspeed_smc-test.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-test.c
> index 4e1389385d..52a00e6f0a 100644
> --- a/tests/qtest/aspeed_smc-test.c
> +++ b/tests/qtest/aspeed_smc-test.c
> @@ -228,5 +228,10 @@ int main(int argc, char **argv)
>       unlink(ast2500_evb_data.tmp_path);
>       unlink(ast2600_evb_data.tmp_path);
>       unlink(ast1030_evb_data.tmp_path);
> +    g_free(palmetto_data.tmp_path);
> +    g_free(ast2500_evb_data.tmp_path);
> +    g_free(ast2600_evb_data.tmp_path);
> +    g_free(ast1030_evb_data.tmp_path);
> +
>       return ret;
>   }

Reviewed-by: Laurent Vivier <lvivier@redhat.com>

