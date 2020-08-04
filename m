Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp171573lfy;
        Mon, 3 Aug 2020 20:54:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcKlNAbJo4Y9C7wG0aSpqL197jphx3HAhPlJVV/HlTNCLfoDZBJwFQUjRctp/YXBPXE/+y
X-Received: by 2002:a25:d914:: with SMTP id q20mr30844971ybg.320.1596513297822;
        Mon, 03 Aug 2020 20:54:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596513297; cv=none;
        d=google.com; s=arc-20160816;
        b=lZGUMrO8QbFCZRhVK/7191dVQ1dP4DskH4+PHdg8awvgaadCc4TRJTiXKuCPz9bMzq
         Pp+5C/azA0MpdnRQd0GXWndpef2oU0+M0/f0k6rosoKfvkq6dU+VIx+MXiNqmxr0xMVu
         /+TO0WfklLmzFSrQ+JoOmvNTJowvA8kdkvv99eN9lNFQWKthO7QMwAn6aqxywyTMfy8z
         Bp/A7Tb1Jagq5WI4iVUqUTU5KoCbwHnwMOPVM0isU+unBQnPd2U9zYsCOunuaogzrIbx
         iW1JDEaXy0lJCjG4SFJJVehvz+x0EsEsplwlf1O1UO05iRYSX4lWqeYOctZATlfeacT3
         bOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vmxj6nfyrQeB5YefZuszP+wIAmf9uqmW5iDuhIZ2zPA=;
        b=dZggp/GGO41MEEOKQhVpBwpFsF3hjHsCNyRJiHJXH8fEDU/3oQ7LaLqlVv3aaBGraA
         kpKZkFMfij910mXEx5zgSncV/YIifilq+J5bkjJ6vZAik52mSeaIejWBpt2i1CB8wblP
         2sNJqW6yNspwOra9VBzqbz3H7nMdZWEyLSh/lLQXUYOStB0Ay7VC461eZDcAfkVy2dpJ
         aOsJYUkZ4S3nO7i/HxN9i/muhjsJPf7iGUBxk2+MYXyvIAk6PzgBfNAmjOPYtri5DeFm
         5tMee91mJkrdKFkIAqEKNjdZH8ipuQHOCWPkmIPKEjAcSrHNyypGABPXpkK9dzxTxkYZ
         7zsw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OJjgSR+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u187si16590773ybb.130.2020.08.03.20.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 20:54:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OJjgSR+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2o2T-00030v-7R
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 23:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k2o2M-00030g-Cs
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 23:54:50 -0400
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:40956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k2o2K-0000bF-NV
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 23:54:49 -0400
Received: by mail-pg1-x543.google.com with SMTP id h12so10009564pgf.7
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2020 20:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=vmxj6nfyrQeB5YefZuszP+wIAmf9uqmW5iDuhIZ2zPA=;
 b=OJjgSR+KovaAf0IK0tD+v4Fh7kqWQ+5TyJQJj2ZTGU9rWIs9pQ6Jj/+yosl8CMGT0+
 8jf94F5qMqpF1utLgV5Sau7WjXsi3Hc0oUIzGxEDzupwuohWnic+8dKMZk2P6TRD7qR7
 tCiST5m7CUd8v/qvaxCNTG5Urjqn9iwIz9bd+lZc+vGLuDs5ntK5ynkG7jP3vWYuFaQx
 TUKRemqYunxDWnkT2NbCULuwEZ1TQpW4J0nwg4WWDJzuNEJn/N/Rx+tX/0FF9PmJ/G8T
 gwUeC2edhbFI1gz9JQR/NYyzObse2sVAJ9GDEWbabFT2aeQ+IPKQJmBmNIkkJVy+qPqs
 OX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vmxj6nfyrQeB5YefZuszP+wIAmf9uqmW5iDuhIZ2zPA=;
 b=H5oKpPSaTaFqbidAmA5+0ckkOi4BUqEDMLyLndCcIiz5G7/dYs5WCloPi/BuskPCDn
 kB7FLWjzYhcTqC3ecx2a6rnJ3uwKueP7hKvmM1lT+nNHZeWu3eC7/CZ9sgh+Gfd8y72k
 8x3Fe+J+XOOx3maNogcGsE1tybfPOVRAsQPdYg+3c8TpfJcbUiIvLEiPFYTSh0a1/28k
 n25Yk8ulPcjVP8yWSOquUqaJoHs2V4/iN49oTE3sMXkzO26RNRY7kJJWO0nTYuUVsVxH
 J4AZbaM73Fyc1bBNM1LlWeP3YvTx5te/q9C8fg3QIn8uOLowXikYKTgbQFkWqNLqHdfb
 VzvQ==
X-Gm-Message-State: AOAM530PbWVmQkDC5Zy4zAuTikPyRfz0FSIJdLR49pCPOmSQfv0Aw+77
 bMqvEG2jfMcvGkRCaHB05vr5xQ==
X-Received: by 2002:a05:6a00:44:: with SMTP id
 i4mr9880839pfk.276.1596513286569; 
 Mon, 03 Aug 2020 20:54:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id m26sm21158962pff.84.2020.08.03.20.54.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Aug 2020 20:54:45 -0700 (PDT)
Subject: Re: [PATCH] target/arm/translate.c: Delete/amend incorrect comments
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200803132815.3861-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8b6b5af5-1e95-c4c5-ec28-027335ef359f@linaro.org>
Date: Mon, 3 Aug 2020 20:54:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200803132815.3861-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: XofQ4NHRG0YQ

On 8/3/20 6:28 AM, Peter Maydell wrote:
> In arm_tr_init_disas_context() we have a FIXME comment that suggests
> "cpu_M0 can probably be the same as cpu_V0".  This isn't in fact
> possible: cpu_V0 is used as a temporary inside gen_iwmmxt_shift(),
> and that function is called in various places where cpu_M0 contains a
> live value (i.e.  between gen_op_iwmmxt_movq_M0_wRn() and
> gen_op_iwmmxt_movq_wRn_M0() calls).  Remove the comment.
> 
> We also have a comment on the declarations of cpu_V0/V1/M0 which
> claims they're "for efficiency".  This isn't true with modern TCG, so
> replace this comment with one which notes that they're only used with
> the iwmmxt decode.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
