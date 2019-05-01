Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp6174710wrh;
        Wed, 1 May 2019 11:39:29 -0700 (PDT)
X-Received: by 2002:a62:5994:: with SMTP id k20mr24699784pfj.150.1556735969591;
        Wed, 01 May 2019 11:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556735969; cv=none;
        d=google.com; s=arc-20160816;
        b=azNgHy5nz1pB1iEEh1DIDsgfxXXg38FabralrtOz0+H1X0r/Iposa1MIgpDUmxOgMM
         NCrg5GkvacbGeoR/1Gvqe19wXfXAHN1H8/7k9chUjSYV19y1/DoXGOI/sqgd4WyMbwuw
         367fjsKZuPg76aoxnXf8Ln/0l9ee16NeyD7zf4vDcWmcCKTtRm89BEj72nQ4mCzJxwai
         yaXESWH7rT2eL8huIoSX6rsnR/tFAD4u3iVvlXOxEkWIcq2K+zPN0qgIO5D2uwkFiMr3
         dLTp2lOmkUQn60B1xOFdNUBgDD2adEeRbR4g2/055p8DNCKu/WEpnUDQwThO+IpmAdEt
         56wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=Kj0keHvXRKBv5NJEBu8JraLrYMQq/S0KTlYv84qVXxA=;
        b=KLPd6hSlDa6+cuVqfTV2ZZ2ZgHqxyheLYz3YiIA1TL8WWk6r1Ifzb404IkJoFLfqWA
         QlcUmpNKExX7FVBqYuMcrcB3xP2N5vhaeu0ca+MEtenCVh6DcN3HgwbuRl5cswSVuj6O
         AcXo0SDVBHM/dGXBloL5Yp7viC4L1O886FHhLKnG8gi9YC1DNTYw0CxFHdwEK3y1UGsD
         TRytZ8uYJ5zJEXsvOpcMkS0QRkHOTIMBKrnVk2DRlOlc6qHbj44ZD4bRbVGsyqSBoiuc
         HxNELWTIjkQPeqbjjBNFeBm/Z87wMdIfgCHg/JbzLSV8cNgoAx/YrdBaaFgNwpq1TEY1
         ufMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vGN4JRgn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p10sor16333396pff.13.2019.05.01.11.39.29
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 01 May 2019 11:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vGN4JRgn;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Kj0keHvXRKBv5NJEBu8JraLrYMQq/S0KTlYv84qVXxA=;
        b=vGN4JRgnQuhs/tknmZkgyeM1T+BF7qTB15kOQuwB8voBKgqkWR5xIJKKN00tVytHoS
         p+EXE3CSczUjaleeGdO5B2MGNjHXxuwryBki7KSIzfYfNvXq+DcUkmLRpBZUTnDU7XYg
         CZ9fRf6x2aUaGmsswwAp23OffSlekrS7hAymQaYmE7EDLdTFjFzLuYbGtmAQEFTSdyD7
         oJo6VTm6ZxWG7kV9pELCK63MANL6pPKRrcaZf7AmYU6iL/oceCRaw+aU7zf55auqJbud
         hA7mRLa6qW0rWI3zlPeHd7Gxlnt5A8k+67JylZKOvxd7JscFSGYn/hPtJPqTHNTfHL8W
         m8+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Kj0keHvXRKBv5NJEBu8JraLrYMQq/S0KTlYv84qVXxA=;
        b=BwC4AtOCH4BR7Xk7egJVxoKoS6VsjcsCHv062pBWBmrudPV7JpGHEcwomuVlslabWm
         CEU8n2OMu/20Jf1bAIBvg5YKCicxtHUS79II+2YUHrIHOjjNzO18J29UuyC8OyVGmUdd
         gXWuTQQOsBzL5hftppPXEkyavdju3fqRLuXY18FWEHu4CvntyEjA8y+ov++dM8Bvika3
         9R7QEM95hk0T8onrzoNKdat16DqUvYu6ahTuD+gi/kl3UhVjxCfOcWLfbhKM14XiZ7fw
         1k0dQRwmbiwv3XcAPlEErd0gx5TzTU3FHtUe2nyzzEDPOyo7xBqQ0gWOwhXsWLuDY92F
         PcOw==
X-Gm-Message-State: APjAAAULzB8k1mYyWeB+qBhx+mRC9JTL/eCJzldLr/Hzn49R9IvFic58
	TBnGzIPhxXoquP1lYacmf3s/5en82cxSKA==
X-Google-Smtp-Source: APXvYqzgK9FKeWfUTvMLiTEetR43z2xqnoPWIJl8rxsgLEvlGpT0K0iOZovy+1s4e/OEaGSSj/qu5w==
X-Received: by 2002:a62:6086:: with SMTP id u128mr81330484pfb.148.1556735969184;
        Wed, 01 May 2019 11:39:29 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-189-189.tukw.qwest.net. [97.113.189.189])
        by smtp.gmail.com with ESMTPSA id b1sm45452573pgq.15.2019.05.01.11.39.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 May 2019 11:39:28 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v5 00/15] demacro softmmu (plus
 tests/coverage)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, mark.cave-ayland@ilande.co.uk, cota@braap.org
References: <20190430165234.32272-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9a538ea2-358a-dc61-b2f3-f8155c1a2283@linaro.org>
Date: Wed, 1 May 2019 11:39:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430165234.32272-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: qYU+vxOZsSGO

On 4/30/19 9:52 AM, Alex Bennée wrote:
> I've also moved the existing system memory test and made it multiarch
> and added the bootstrapping for aarch64 system tests. I would like to
> add support for Big Endian as well but I didn't want to delay the
> posting of the series. It would also be nice to exercise the
> ioread/write paths and other handling but I leave this as an exercise
> for later.

Somewhere in there you're adding

  -chardev file,path=hello.out,id=output

but there's no corresponding use of the chardev.
Which, somehow doesn't seem to matter to your aarch64
testcase, but when I try this for alpha I truly get
no output at all.  I needed

  -serial chardev:output

to populate the file.


r~
