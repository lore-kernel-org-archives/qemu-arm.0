Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp1527424ejc;
        Mon, 13 Nov 2023 10:16:31 -0800 (PST)
X-Received: by 2002:a17:903:1246:b0:1cc:5549:aab8 with SMTP id u6-20020a170903124600b001cc5549aab8mr448774plh.5.1699899391586;
        Mon, 13 Nov 2023 10:16:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699899391; cv=none;
        d=google.com; s=arc-20160816;
        b=FG3fMFp+ycswJH1trAVd6YawY7t+QNUXQ7Y/KHZOmgQzw5OxwbX71P2PQgUqVLlBZI
         5CQ5t46x9VGKN80iUnCE5DA8O3d5GmtflVpMpC3GUOMDhNVf+cwyEsqx/b8YSap1YCum
         +h/8Ym9KE8iC+Sxi9c2wnUyDohrOTxZr+gT6MW+aNNXtDmQ6tgmiDHpa4994y4TZcs81
         hetzzsAHpL9tOOUxiGH1dL68tN8zjT6esz1hE9S4lMhGB1ToMxUf/f5k9tqjPB4UHnWd
         Qnrs5doM9j2tbLcrkQ/kCpR7eBAwPiLGyi+BUUUJd7G7554CnaKNy9x8BSygeaz0ZyPD
         jNJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xGaoCvEhVKgnKhzAuH2lcBIsGnVExx6jtGAjreAN1U0=;
        fh=EvOKQYaIe4I9Kcy6c/Ll7Qwfc3jBPyyxi3MLAzaX1fM=;
        b=Lvpcrtin/bSay15vLSoks9H+ZJoBoyIjhf1s5/7PDYl8qq2MeHZAB4xRnjYISBl/xo
         wpzhtoqPyl9XgTz5ytMwxmjmqrSgIfRyKNvKPP8H/EofHqgFaj3rI0la2nLpIHgSIWZd
         kwgRM2F8f4IY68wF0jxZeAqxD71WFoDVflP8jh0eqE2JswozX0SA/Je5w5R7Pik18IE4
         sPyqipqg3XXT7fJwKRADsiIkKoL2T0QuHDDkhFrawcNw35bWDzostCLtRDZk1DLnm9OP
         kE8Yf2fzdj8y0kogSDLvTt8G/MjV5JGSBrcpOnPVFjsMc21Lp4PRXa+1+hnGSq9RwXjH
         KpNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oOTIjrM8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id bd11-20020a170902830b00b001c61308706csor151872plb.4.2023.11.13.10.16.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 Nov 2023 10:16:31 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oOTIjrM8;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699899391; x=1700504191; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xGaoCvEhVKgnKhzAuH2lcBIsGnVExx6jtGAjreAN1U0=;
        b=oOTIjrM8dpMCLzIfYafvUNF+FKttIdPlLi8qddyoOzTdFskL4mc57JmwANUyTcsmgD
         oN7ULKBN7zpGJbORu1DmSVKPj12pH93Ck6BogviVJpl0EoR98F1JT0hwleAIaNmHb26U
         91jDKMW1OF5Ys+mBvTN9+pAEazJSOFlDk/xkaZOmaEfqwZyEoJsuG8eO/Upolzgaf2VZ
         Eizi7mpqScjjEN1ZLWJJN9cZOMMlN8Rxqp9Hofy2/QarIH0BcMhxSIfmWbkFe2yHT/Nj
         N9VT8UyUy/WRPax6xsPgmyPG92F8YJ42an0B1av7VN6+e3w6a16AxsbZ74wU5TtyIJXY
         FDfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699899391; x=1700504191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xGaoCvEhVKgnKhzAuH2lcBIsGnVExx6jtGAjreAN1U0=;
        b=SWOAPNv8E6PQqZP3V2xuxMBfGktZjQFotOKmq9RJznVA2fSCQsGqCTZsvTzjYk+mX9
         B9PJWAHkBCxs2zNzq2sXM6XJeFAbNnxO3Kw75ClX2akP1UUBmulDTFLfcfrum8P8RKy/
         TBwE6M2KM60jRBUi+opc4fSRucZDA2tkpsfuXUNeM48tJhUzntOacFJhve+h4AZ2CO93
         xJObM03pnj/9oZXtUNm6NW1rvJT4d8iLSRqn+Eph8D+ys8zk7rj3mldl6+gzr5/F8QRD
         aW36LugB5rae43zjlKth75EXM8OiU1gBa2vRDjchR59sjyLOev6sD5P8O6Gg4e0asY23
         yFUw==
X-Gm-Message-State: AOJu0YysRn7ZASrU4d2yv/Mt7uHwbotOgY1ycTZIBgDX/okCd2Vbtnm9
	ZFOzzG4phuarSefz9dgBHOYijroBGZ9wR29yUGiJ4Q==
X-Google-Smtp-Source: AGHT+IFGtFwOCO00qTve4imDefB/v7Y14ItQYfH6PPqxvc6xD2b0XUfTEVU90N6JSOVtl3xeUhxBSg==
X-Received: by 2002:a17:902:b693:b0:1c0:afda:7707 with SMTP id c19-20020a170902b69300b001c0afda7707mr310903pls.34.1699899391077;
        Mon, 13 Nov 2023 10:16:31 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] ([71.212.149.95])
        by smtp.gmail.com with ESMTPSA id ju10-20020a170903428a00b001c59f23a3fesm4142792plb.251.2023.11.13.10.16.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 10:16:30 -0800 (PST)
Message-ID: <a50b0790-03d7-458c-834b-907e130bb5fd@linaro.org>
Date: Mon, 13 Nov 2023 10:16:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 04/10] hw/xen: Factor xen_arch_align_ioreq_data()
 out of handle_ioreq()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Woodhouse <dwmw@amazon.co.uk>, qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, qemu-block@nongnu.org,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20231113152114.47916-1-philmd@linaro.org>
 <20231113152114.47916-5-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231113152114.47916-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: OqHkl1cU3LbU

On 11/13/23 07:21, Philippe Mathieu-Daudé wrote:
> diff --git a/hw/xen/xen-hvm-common.c b/hw/xen/xen-hvm-common.c
> index c028c1b541..03f9417e7e 100644
> --- a/hw/xen/xen-hvm-common.c
> +++ b/hw/xen/xen-hvm-common.c
> @@ -426,10 +426,7 @@ static void handle_ioreq(XenIOState *state, ioreq_t *req)
>       trace_handle_ioreq(req, req->type, req->dir, req->df, req->data_is_ptr,
>                          req->addr, req->data, req->count, req->size);
>   
> -    if (!req->data_is_ptr && (req->dir == IOREQ_WRITE) &&
> -            (req->size < sizeof (target_ulong))) {
> -        req->data &= ((target_ulong) 1 << (8 * req->size)) - 1;
> -    }


I suspect this should never have been using target_ulong at all: req->data is uint64_t.


r~
