Received: by 2002:a19:6911:0:0:0:0:0 with SMTP id e17csp34347lfc;
        Fri, 22 Nov 2019 00:48:44 -0800 (PST)
X-Received: by 2002:a5d:4c8c:: with SMTP id z12mr16280682wrs.347.1574412524484;
        Fri, 22 Nov 2019 00:48:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574412524; cv=none;
        d=google.com; s=arc-20160816;
        b=eUm5H1l1ntulDf/prv1/Mdj3kmYR8gSVZ5MBZMgInTB+kXjKiW7yOUdytiGXbwoRJ1
         ndRgKHp3skTyyV67JNyJw+nanvX4p+3lv3xEZpXF3upbUJza56iv5Ul1F4qS2RCmH082
         4L5cSaxBVXFG5OBkTnJMW7w7dR+QzKJMtdTtELQgINfbJvziTPyCQhDwfjmodFYKp/+C
         sVRVfSLqqckOLljS5h9O4DTiHrh0Y2/zuFFafAP1xne3GDEC3uFv5RlNXHWz6GQYCQ9O
         XdTbRTshxKAk9E6pTe9VUNuXLaI4QesfFkL56ZJCHYzwknfNyFQ5puMG5nnHWCRpzUk3
         Ukgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=C83CqTTXMKHVxF9fBHADOxXrwQhrwdOuulbdHa0xEM0=;
        b=CCo2IbncYvy+bi7SBXh/fdaFQkOtPoCIaUm9PopmmiNurmXMVE7wPJg7Y0yaYtOb66
         5QyvXEmLdCt5hR46uWgeK6T30oPrb6XHxVfFBjx0ghAGCB/7G9dQr95PClY1Y7uPjiJG
         /tUS2AZwQiJKmeqg60jEJMq4T/CndmpnL63U9GiQ3HcccNSCNA59KKB+8fj+AT7K4R9C
         RttWPIci8StfNqbCBvewg3aU8WPRSevNGXs6xQquQCoTJE5RwNHLQlmT/yimLUE+BirE
         qDa5awWHcRSvpiVgDDGciMsrsfs4p7tPH4tNadfT2a1dk/TOVgs0kCGKF35ccbaE+k2E
         sVsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x+KWXQx9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id l7sor1344283wmg.29.2019.11.22.00.48.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 22 Nov 2019 00:48:44 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=x+KWXQx9;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C83CqTTXMKHVxF9fBHADOxXrwQhrwdOuulbdHa0xEM0=;
        b=x+KWXQx9lCsyIw13nx2bQGMkKZekgoRL1uPL6UURHQngDKPPpSwF5A1mdDC1ygPeHV
         0UKn+fg0vY5KAn6VM3QdYheOoDfi8Tv8Rc3rxdgHUf824Lv3CRZYAQeJpqFnb3dCwS1E
         HpVajQa+aon87s6PF+2fXt5rY3c6z/5Pq6slOCMSxizPvACg+f0lu3kiY0tAQWK9xR7u
         i/GOkkiVsYWvtgl8WVyZUAa/t6qh2IdO3D84mHT//MSBCClKk9SRrctsgxkdWWgfU1j5
         ZR0WvyxXiBc/0TO8GWuHEmCnNeZAbh+mhuEAzYlh5jmkOGKp0L27wgD5daXNm60YW5tv
         fNgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C83CqTTXMKHVxF9fBHADOxXrwQhrwdOuulbdHa0xEM0=;
        b=tqAPDGor/pEzrf/JxAHv+Pgww/NhEl0WvVc25vdIFFsPoDWQaSOSdNPfHb6/otkb+I
         apB3/jht4h4Gk5qaxVxmlJAJSZrQHXO2emGX6JIq6kjkFNectEqaE4Ri3F/rGpZToL8M
         GUSgMoKO69kdME9azZc3ErHgHUguFx0dh2nxRL8SNVSYqoT4A1dX98/R6r2DULwH/t2n
         kT5UjSJgMDEZx8h+xpOxlf+/CrivZMJBX986gh0aaG9OgPppHPkWVIiUGp/Io3wbiZJB
         8AhjGfPAKH8ZiVrTXj3lrZzUbIwxw5QioSf/Cc1xWbgn9d5+gxyf0rtVRUnyzC4hakyS
         JB+g==
X-Gm-Message-State: APjAAAUnlzwVgGx3kcFz0G8ZqGFx9X5IRXqA7/NNjny2IOl+0yAY76Le
	ozhuq3cAAN9LFlwwJDDAIAzxzsy8zJ8fVpZ0
X-Google-Smtp-Source: APXvYqxRBn4AeFNTuZE/2M6a2FYrqu4hUAQ3XbbxBmWZb+BLLQrGrRHBafcKRnwSBEcA23qRT4teCw==
X-Received: by 2002:a1c:f210:: with SMTP id s16mr15285356wmc.76.1574412523239;
        Fri, 22 Nov 2019 00:48:43 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPv6:2a00:23c5:4e1b:3700:8d83:30a1:2751:30ec? ([2a00:23c5:4e1b:3700:8d83:30a1:2751:30ec])
        by smtp.gmail.com with ESMTPSA id o189sm2829003wmo.23.2019.11.22.00.48.42
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Nov 2019 00:48:42 -0800 (PST)
Subject: Re: [PATCH v3 1/4] tcg: cputlb: Add probe_read
To: Beata Michalska <beata.michalska@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, alex.bennee@linaro.org,
 pbonzini@redhat.com, quintela@redhat.com, dgilbert@redhat.com,
 eric.auger@redhat.com, shameerali.kolothum.thodi@huawei.com
References: <20191121000843.24844-1-beata.michalska@linaro.org>
 <20191121000843.24844-2-beata.michalska@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1536641d-9291-edd8-e04d-a457f5e50ced@linaro.org>
Date: Fri, 22 Nov 2019 08:16:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191121000843.24844-2-beata.michalska@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 8cVCCruNnHb7

On 11/21/19 1:08 AM, Beata Michalska wrote:
> Add probe_read alongside the write probing equivalent.
> 
> Signed-off-by: Beata Michalska <beata.michalska@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/exec/exec-all.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
