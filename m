Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp2371038lfa;
        Tue, 13 Oct 2020 15:32:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzFUCXxafTvSLaOhW/g6+9+YoLTAGfiUlSUSgRmeuXhkybtxUaBOUsd+9wsN1MbQzZNNVdl
X-Received: by 2002:a25:5985:: with SMTP id n127mr3124378ybb.53.1602628326266;
        Tue, 13 Oct 2020 15:32:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602628326; cv=none;
        d=google.com; s=arc-20160816;
        b=lL+J7Hc9+UDg26ffXZ7LNIx08ykOodZ2C4GRsvO80fyo8cMtNrMX94f6nrXIPkqeP3
         5fSImDhvplFrwewRwgayYSAgvPD64mYxNqioRoIk+9z7m8b2CCilhrIlSPre1cnItFF9
         POLtZUNNL0x1LR7RfbNwawfurv3Do7Ba7bVfGFrPkT8o3/fVQplFAjZSuAiU9DbdcRRm
         4xHiuB5SLFnJQAZAdRgNwsNc+CPM4gJxucNn/xDHhor3P6cF/v4kENFGunfchOlC14DF
         wUEkpa3405bcvyoWWlEveXsnN3mKk1vEZA/XLvzhCcEMckupuM70vqYPJVkAGXRbrNGh
         QT9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Xct8EB2JXJGbJ3zKytAaLNNDCzXsSOE2AkEo2n5lLUc=;
        b=KvEl7LOr15fBHfo32A7kb3mjwoXPsIrB//l/5X0jJ3rt+Nr9gVqrMbwUfiuKIRXxQz
         1FlHlnBCUN20tc/f4rlrbMX4pyaBYoNcahUt30Fbycf52zlG0h+7rdNy80DDq4eO763J
         EkCXObzWl7RU2P2d4LUG2QhBFDGe0RfO9sH5oiydYZWnByATV7i0I2ZQWp7SL7NSIYR5
         MTF7YQDCDAVrKLFEr0HwH4jSlKwrJIQ5CSfN4qUlOggZYb1bgGgfkiKK2B6SvjEr8YI5
         PR1RcmsN7iU2SplLYHYEdPBQrgY5LmAPqNNDCjneM7zU2CTodPJvjCSuEpzPK6hWPcoj
         ZSJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=soWFH3Mr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u17si1416232ybj.107.2020.10.13.15.32.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Oct 2020 15:32:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=soWFH3Mr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kSSpx-0000FM-HA
	for alex.bennee@linaro.org; Tue, 13 Oct 2020 18:32:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSSpW-0000EM-Fj
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 18:31:39 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:42199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kSSpU-00004z-6e
 for qemu-arm@nongnu.org; Tue, 13 Oct 2020 18:31:37 -0400
Received: by mail-pf1-x444.google.com with SMTP id x13so714189pfa.9
 for <qemu-arm@nongnu.org>; Tue, 13 Oct 2020 15:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Xct8EB2JXJGbJ3zKytAaLNNDCzXsSOE2AkEo2n5lLUc=;
 b=soWFH3Mr/4mmAuLL6ZtplFJY/h9isZh2f5fqwNZFtrhH+0aQA5paKpn1c+iWBENExf
 jzuTkHbyg29lHM8GbUS2dTbkh+5iU3wWa7jE4D6pU7IGnY53b3SAW+X2RwSG95PlYLid
 Oknkd5+9Hj1X2c/XioRVGnHtaZtYBUe7rAzMcev5iyXLjWxJaqXYTqLiFpBpU0351lJU
 v7yiuimsvPUMBdyCgYS0MFuDxBr+j7bLWATgbR/V6Fiqyn6Zje3zk95NITZoCMXnIwDW
 /EY74w62f0yq6JuZWw3izEiewJfRwcGbCD18O4+JywzIsOCoiv8i1k23mXC5ugoQgHw5
 Jzlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xct8EB2JXJGbJ3zKytAaLNNDCzXsSOE2AkEo2n5lLUc=;
 b=II3w/aqM3JR4zeHYaKXBBT7FZ9jA09a360S5+uzAsqGZyOqXZYe5D6JA/XNh357nJR
 BXeXsCh26o9r2n3+80A1F8eQj0aJvHaZ9OhM/Sv3CAXiYT0UJRdBfCtvEKe3oH9oi9W0
 VQ8K8nHuEnc0+KTlS7wJF3tB++aGxsraoXB/YhWxjYzetKkKuBFx8nxK5pkjV0iVTq8q
 BH4IMY+KYgCtg63rfPuQZTquS8DEvbBiBY2roNPsyLzN/ncAVTe1f7o8eQucil375sEW
 +6LLYSp7wy8dL5ObP+jZPUdbyF9Okbt0CGzRCQHK5TUULqgUHQoS4vx0O0nUO5X3urKL
 9IBA==
X-Gm-Message-State: AOAM531CO+UrENILb3YJpk8QDgSWfutH3BV8eryKbf92QizuD589cR0l
 P9ILRn7vgovE1GG35sHdCFMkAg==
X-Received: by 2002:a63:5f97:: with SMTP id t145mr1397852pgb.115.1602628292207; 
 Tue, 13 Oct 2020 15:31:32 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id a4sm731440pgl.51.2020.10.13.15.31.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Oct 2020 15:31:31 -0700 (PDT)
Subject: Re: [PATCH 07/10] target/arm: Implement v8.1M low-overhead-loop
 instructions
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20201012153746.9996-1-peter.maydell@linaro.org>
 <20201012153746.9996-8-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ad79b081-211a-a591-4de1-7fb0096d331f@linaro.org>
Date: Tue, 13 Oct 2020 15:31:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012153746.9996-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::444;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x444.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PqVP0nz4a297

On 10/12/20 8:37 AM, Peter Maydell wrote:
> +    nextlabel = gen_new_label();
> +    tcg_gen_brcondi_i32(TCG_COND_NE, cpu_R[a->rn], 0, nextlabel);
> +    gen_jmp(s, read_pc(s) + a->imm);
> +
> +    gen_set_label(nextlabel);
> +    tmp = load_reg(s, a->rn);
> +    store_reg(s, 14, tmp);
> +    gen_jmp(s, s->base.pc_next);
> +    return true;

Oh, fwiw, with the tcg optimization patches just posted, this branch is better
inverted.  That way the load of rn can be reused on the non-taken branch path.

Maybe sometime I'll try to propagate the data to the taken path, but that
automatically requires extra memory allocation, so it'll be difficult to do
that without a tcg slowdown.


r~
