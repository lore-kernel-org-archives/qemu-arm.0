Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp1376515ejy;
        Sun, 25 Sep 2022 03:11:40 -0700 (PDT)
X-Received: by 2002:a05:622a:314:b0:35c:ee8d:f903 with SMTP id q20-20020a05622a031400b0035cee8df903mr14105914qtw.588.1664100700047;
        Sun, 25 Sep 2022 03:11:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664100700; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4XM1TM5cAYpGv2rHEIclHB6WRDBrQ9bFxpMYxqnHqtbanFDdxUvEeEVnoe7bOC+FV
         43J7V2Lp0Lr3bW+BqnKDrE+ayAoSycBv4Yki/qY5iL516B6K9K4iapEkdoLW/0o6TixT
         iKsD3IOQIkrBKlM3v+MLO1SKa9554R5WHtImhSZA0PJMr9sLZ41DsWIl/i+d9smjT2dL
         s4uxYyA00xfHRRfSZ6HCJeEFpBgEwoepiev0rltvkZPL07MKrpHZdLc33cY9x8ZdmCwX
         Q38MKGQFruzmiLQUPKLUeIta/8bjHcv6AgrX9YFy22q6cBNfpJavONwYrmw/RbRNgqIo
         Rg2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=MaG2etLN4GgasCsqD7UFfdGL2hvSpf2R2EX6hvjux04=;
        b=wev5QMODxW5Rqen1MtdjciVkNmqR7U6QP/NsG/nLAdds5GsMEG0WKPv25/l2V+Ma6c
         H8tocxmp9eWkI741dP0ny8S7Ko2Gz4PdvuPqLphmvzo1uGTkYWtImrUgELyhH0fS85OU
         IJHErRkphhiK3xDDZ/8cDHfCcjhn/3yBaOkNAt1S067BZhCCWBiGxhU2nPHPr5riD/F1
         ZERVAnIdjDvHvf6HcqoGIydpxIN1ZSEPjXgCtUuGI/4NQIMm5adWpOo/su/uoknN+pA6
         Wr2mUhXXi39QVt/4IHP+QMAgyh+Vf06CV85XnSlbuQJAqts3+DigSajg5qIleff+a3cs
         vhpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MJsI3yLp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id z15-20020a05622a060f00b0035cb7db3176sor4668045qta.37.2022.09.25.03.11.39
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 25 Sep 2022 03:11:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MJsI3yLp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=MaG2etLN4GgasCsqD7UFfdGL2hvSpf2R2EX6hvjux04=;
        b=MJsI3yLp/y7ey94soTUmlkGYkVdAf5e4GQW7Nn+CFCHJN3IIdBxWELpJXbCIgt78CC
         9pxPCskcnRCCWayConqhxfyN16xwrv3+9pl9eovnIwArnLATP1JR4oimE82LC3sLVVS7
         4jlESXJ4BWZ91LKReyWhfi5dMxuqcBgUbj5Sha/UeVBlvPyhnpMrg0PVSddK4bRrmjYE
         ZpR/KirI06eCr7RbkgAkJrdldzMMQ3aH3bA38pdX84gGMZmqK1x3ly2yvjLPRo/0Vy8s
         4uOxhGZ/AfJl8wvySYirJUqi7AXmJ6nAgyiu9/dTijazT3o30q2ak8LLRDQHR4DVUR5o
         EdBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=MaG2etLN4GgasCsqD7UFfdGL2hvSpf2R2EX6hvjux04=;
        b=ZUWzVv2tI6XLt3ppuuv4R+tOz59BOQqjUljwmy2wAO64I7Lve07CfkR+r4O11uMcLJ
         4oXjh/qXR5EGoF7pCShnqDaXDcy45V+JXAWohBNcKmQ3Eh1saJSSJg0FB41BZ2dzwHpY
         R2Sk8vRDatbdhAudhxHhXx+druRIk0GjWVYUTM8AwxRQMeTm1/cUi81fLu9WewPGGGFr
         KiTDVvxH/GOcwsnRNAJNPendcXnlNKhEx8Aw38YjLDHHhYxgyoJTrsPPShQVICtAAB4H
         0KDWkOwWFud689qKEDT4ErKJIS0AEQZpkdsSdLNGIjemdmbhXTbK22MqK2FuONwWs+yr
         MZUA==
X-Gm-Message-State: ACrzQf2joA2TRD1x0p3kQCT37aNmOcDx44jko2xQsds+JFYFi2SSREyz
	4WnBrXLPTYCVUf4Xdt/egcWM6i4H4EXzvoD5
X-Google-Smtp-Source: AMsMyM7BtBtmkzVhzMqbBjMRWWuoGLtvME2vPKpvGjYC0igInyF/XaLfa2aqQ+WsCiC4AkWxcu0ApQ==
X-Received: by 2002:ac8:5884:0:b0:35c:d949:30cc with SMTP id t4-20020ac85884000000b0035cd94930ccmr13698635qta.528.1664100699573;
        Sun, 25 Sep 2022 03:11:39 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2605:ef80:80b2:413a:430d:cdd2:88af:d4b3? ([2605:ef80:80b2:413a:430d:cdd2:88af:d4b3])
        by smtp.gmail.com with ESMTPSA id dm10-20020a05620a1d4a00b006b615cd8c13sm9837173qkb.106.2022.09.25.03.11.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Sep 2022 03:11:38 -0700 (PDT)
Message-ID: <558abb7b-7c8b-f10a-1381-8495a47c5809@linaro.org>
Date: Sun, 25 Sep 2022 10:11:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 4/9] hw/timer: convert mptimer access to attrs to
 derive cpu index
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, Peter Maydell
 <peter.maydell@linaro.org>, "open list:ARM cores" <qemu-arm@nongnu.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-5-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220922145832.1934429-5-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 0KvNM6zKUOlV

On 9/22/22 14:58, Alex Bennée wrote:
> This removes the hacks to deal with empty current_cpu.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
