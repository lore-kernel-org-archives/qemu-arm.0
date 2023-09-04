Received: by 2002:a17:906:cc96:b0:9a1:fa4e:495e with SMTP id oq22csp1181912ejb;
        Mon, 4 Sep 2023 01:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyf5MDi6itIVZeGez1WF0betsH0isD8hsCNS/cw541YlKuzA67QGuram7PZ56nb2PXw0q5
X-Received: by 2002:a05:620a:4251:b0:76d:a93a:1f71 with SMTP id w17-20020a05620a425100b0076da93a1f71mr11533977qko.9.1693815706185;
        Mon, 04 Sep 2023 01:21:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693815706; cv=none;
        d=google.com; s=arc-20160816;
        b=tHodr+309JpgbGHIolF8HBP6pvDpNSmO2nzDEjpVjD02rnCUSYwkBx/S3MglnkxO5+
         hBgWpx7z5LRvRsDds2SC6h432WaXbfgXbZIhPW/9g8fyvjD+FsBpvPhgno+xLhSLt9bw
         rk4IFjbi3TW62s7N/OCDw277GksOejlSAPrOUpplLPlCzCjkCTCWVdBFUZp/5XFCrQN7
         tx26CG5civJVduBnwZCYss6U2bHbTUNgXUHFP7n2fOZVrh2O36+IhuvDQ0z0aQXFG1B4
         adu9PKlHN6uFiKsRHh+s8jSc1IwkEy+55xpkURFNj7cjz1+nKXKVFtI1yBTT8dtzFNl/
         c26Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dqtoQqNKSlO189pIgYPaMe9BsWnF20NVcp79jGw8ZEA=;
        fh=dn2NIlLylLoTjQ3W1s82qzHwXtu1FS367+U78jjAWHs=;
        b=03J3FK3Su1syogsTIJReKm5itTscAinDhu8qI6FMIDvldPbUQCUWHyr+pykx7ZkxFO
         Ychc4QuzFMCyAjc1iQr7DepiyXcVDNVMSMxBfUDSZEbtXbq/iNYJv8UJe2BVfIMRdBz3
         5TjuRf55YcpIaMP2kH1y0RHfYsua69T0E7cR9gjszZ4bUN5CoaxC1PejXeQ0xezeMsQn
         Lf84FJjmmfneX39xiu2RXMRWOidXpvFJexLon8j+zg3FzpDl3OOPksytRAoRamjrbEWJ
         DKgbCDeaqByjrSmW4bKZ7WVWV3MnpDscKOZjcpodv0JTzXKzAqZdkWR8A009cgno10qU
         q+iw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WgVyurW5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq43-20020a05620a46ab00b0076d1fb570cbsi6287414qkb.742.2023.09.04.01.21.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Sep 2023 01:21:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WgVyurW5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qd4q5-0000kY-Fc; Mon, 04 Sep 2023 04:21:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd4q1-0000jR-49
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 04:21:37 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qd4py-0001Cy-Vt
 for qemu-arm@nongnu.org; Mon, 04 Sep 2023 04:21:36 -0400
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-99bf1f632b8so180564066b.1
 for <qemu-arm@nongnu.org>; Mon, 04 Sep 2023 01:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693815693; x=1694420493; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dqtoQqNKSlO189pIgYPaMe9BsWnF20NVcp79jGw8ZEA=;
 b=WgVyurW5neYZyOxT2KUx4/zhq+QPtzFz97vFs5y4zQ1/ZsbzYXA1zVFqrXwebMWu9U
 jw9XiOoYHdai06dQqrU3gkc+kfesdRjYMZNd1SNsYKFOvcJCLcxyNa3nIMIoxeTy0Iu+
 Y8LX3tUONwh9XmEJMOPKF7Q3WimccdcBkIQn3oc2sGQCAaLIre2tpgmwwOZ/psxPM5Pg
 xAoVhFt6XOS5P28dUgP/ZgeLlPamrML81dJCjqidwoBbhofkTrcSJ9zeE0imGq3YSfw+
 RAHX13z+fq1JTYDcvg2jokvDjBw+CAdKj9H38/gEQvMuDo3ziZVr1bEoSTtxuu1LQmHu
 GXEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693815693; x=1694420493;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dqtoQqNKSlO189pIgYPaMe9BsWnF20NVcp79jGw8ZEA=;
 b=giw6bCH9lRM0jPR4i2BQXqDrbVAV+/H1K9rUmY+9cTaz7lIn92G3DZak1AQuVCyaT/
 qube1zDWnisKu7nmOCo1CVQLnbr4xYzArgE1PD/D7xPAdV2qvlR7Wz/b0qzgbhIVQypi
 GWau1bGi2bvM/oHIKM1wEKzhRUeC5FpvaI7g0iIgGXuvp4rJvAzkTiqShGQETyECH7bz
 rHqpcxG7iLXaFVxKiGnT2269JcDA+79DTes6MDAlul6aLw7+XfblbuEiNBgvK4WNtWZq
 EZOgmeBfn+shpQS79TagjjV/Ko/90P0KwOVowaZcLElyUU0DPj2N3tdXJWnuByeTbBGs
 XQYg==
X-Gm-Message-State: AOJu0YwNI5rI1MtoehwhkeVNeZvCyJtEfjfxMGjzoKmg1+y1IINKJ+u9
 7wFZq1DsjXa7wl8N35wY5In4nw==
X-Received: by 2002:a17:906:20d0:b0:9a1:e994:3444 with SMTP id
 c16-20020a17090620d000b009a1e9943444mr2604289ejc.3.1693815693536; 
 Mon, 04 Sep 2023 01:21:33 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.209.227])
 by smtp.gmail.com with ESMTPSA id
 z17-20020a170906241100b0099cf91fe297sm5963457eja.13.2023.09.04.01.21.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Sep 2023 01:21:33 -0700 (PDT)
Message-ID: <46d64808-6e88-5464-e10f-517a23488f6e@linaro.org>
Date: Mon, 4 Sep 2023 10:21:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH 12/13] virtio-iommu: Resize memory region according to the
 max iova info
Content-Language: en-US
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.williamson@redhat.com,
 clg@redhat.com, jean-philippe@linaro.org, mst@redhat.com, pbonzini@redhat.com
Cc: peter.maydell@linaro.org, peterx@redhat.com, david@redhat.com
References: <20230904080451.424731-1-eric.auger@redhat.com>
 <20230904080451.424731-13-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230904080451.424731-13-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x636.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.473,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: YPfvXQXdOEO3

On 4/9/23 10:03, Eric Auger wrote:
> By default the virtio-iommu MR has a 64b span. As we intend to
> remove the VFIO assumption of 64b IOVA, let's make sure the MR
> is resized according to the actual GAW of the physical IOMMU.
> Otherwise we will get a failure on vfio vfio_find_hostwin().
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/virtio/virtio-iommu.c | 6 ++++++
>   1 file changed, 6 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

