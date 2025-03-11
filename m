Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp2023946njc;
        Tue, 11 Mar 2025 10:44:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXeBEsVe2bwfCrafB8A5pxfBwrSVQRNFUyDXAXtM2fmLkrFrMsw7WV6zBwzKogK20JRVWdwqF/S/9bojQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEc5AaUQlqeRAgzo+OwMw2S31o864O6wzZakElq4CaRpNYknfSTAZ3H8hNCSNlPNzLUPvTW
X-Received: by 2002:ac8:5a0c:0:b0:476:89d2:8234 with SMTP id d75a77b69052e-47689d2926dmr108719731cf.36.1741715092031;
        Tue, 11 Mar 2025 10:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741715092; cv=none;
        d=google.com; s=arc-20240605;
        b=R2oJGg6OcjOhO/LMV0KwW7Lro7eaUL9h9n9OZe9P2N4Oi76/wzTawrAGXeLGO5lGE7
         aZ/Af1ClgdMKhObtBsG3t9pw3GAFuGQpyuBcfoGw0uIjQDUJAcVdpNvuPDaee4audm6O
         Bnbh/OTGmGIeGvqM0vshJuv3u55+me0fZqouVsfstE6e7VFRchvGWkw9AsXnBEISHNC3
         CjJqf98UtFsR0lZlehMAhFKKssAww4LYAvHLEAL6Y6DDqSMotOxgjuz8KIDx06+wCEgu
         t7/yUg6w7ymVATv3YQi7mRhtnNuB7PJ6moOjF2fTfrjDjVgI8CyNId14hlhEiKJVMb21
         RmIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=5zlnRfPyjY/Sp7JIeHW6Kpn5XmFSsf1hUeY7YrVroyk=;
        fh=ZL7tl5WmFQmsWXSRaPFntgyPjr1F+pXKsOj4Si8S7+M=;
        b=Mdh3NSxHlQYuO5pt6vc5ZNlCscwZw7naYGUd/EeMhehZ4paUxd5mYwiNTn9CFqBYO+
         zuAQ5F3OpwJs1VLjiMV1PSpPzbMe6KVWyrKRMr32RW69t5wa5e3VT+nYNX3oe+s858n+
         2NcmjdnLWEnoYm6165l6614CHezUG/UJxuIYPWs6oYYkvMJYhMANBUqFKpC/apQKLWMT
         S2RffLrEIi8ErFOhmp2d6BGvhy2i242J+0a4bLGf4r1Sjvs/4pm2Fuaz7otCeFY6jWOQ
         nyWy47/zJRaoDy3lGV75Yqjspbay5Z1gOAYfaErKga1/DQrVeRRX86zg5edA58u+cX/r
         3jQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RDp4fw4h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4751db3c2ffsi115180751cf.481.2025.03.11.10.44.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 10:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RDp4fw4h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts3eq-0007QJ-UV; Tue, 11 Mar 2025 13:44:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts3en-0007H1-Hj
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 13:44:45 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts3ek-0008WN-2n
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 13:44:45 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-2ff6ae7667dso11029215a91.0
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 10:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741715079; x=1742319879; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5zlnRfPyjY/Sp7JIeHW6Kpn5XmFSsf1hUeY7YrVroyk=;
 b=RDp4fw4hLrFo4RSYNGrmaysrUuZqlq1Mfhm/4gGXctudBylIUjkAHLVlPXDM1k0saj
 u27A0SYKgOvVj18MhVg1/dI17QxrNuxX3h501cSNKmFl26z4uQq3nnFt7ZDvuA3xbRDV
 AwIgMkcDxy4nw3pMdzk5LqwLoBwcw8VQNT3JSK6wwu808btGfVoLzUGvprzLkm+eck5/
 7vtNRzKA6NV1ggCWxR/gwS2LwkRM5P2tmD0utOlFf/pu8IrK+Cz5kpbndLoS0INoGVv8
 qRyCcd7hmyHtxLP4D333yieBYgPSs0V5OZa4KchMyD9nqFKnPCIuiGM0T3HaGOEyQbAf
 BGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741715079; x=1742319879;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5zlnRfPyjY/Sp7JIeHW6Kpn5XmFSsf1hUeY7YrVroyk=;
 b=GxgUriwh49kkI9YsrSbHeUxNt6HMHMgFCEd/LKCeedWrLCoeswxbcsGiG84Q2XB28P
 IRImNwYNxaG/LF1hILVZS+LfV0CIMdNZy7SkeHdE48xkv0rkZ8xtOUtNXk93ecpHEsKB
 8uoc2Hsih475SPU43257Yr+rqltLOEalNX1/hkaFqAvNNJ8Rgxgf0hR4prIqSQZpIu2p
 3pHSwHOfXQPlFSWQn4GQDjyaK71Cnx7r1EJCooWT3ErSTfIp/iy7g18OENVKoICuCNjS
 cti8LgG9gKx7hI1S6ELFRGww1Brr6HJvgZg5BR7i2mZps9nUqLrz/XPOMuRnihDKjfie
 qfFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXaGhjO9o9mzs174gzYBW73RJjW9fFkVD52ALi22Ah5aumqOLg8++Bl+bBne4AfbnY7GiXwFD0hQ==@nongnu.org
X-Gm-Message-State: AOJu0YyS3yuB1BErLtk9x26n1LwJZ/RMWR/IKvCmYgSjP7mHBSQHpOSk
 siMDJ4GymfYvbmL7+/I3MOnPCAGkJBb7Tq6kBLL5+lmrenEKSjNNQZGGDackxBA=
X-Gm-Gg: ASbGnct837FOG80N8+k0MC86DX84tPZp/i7WNcd4y4Ypllh/3hc0l/FOwyRLKbY32cn
 9i3rXBc3IePOi9VPZZ2f1tWoV5+1HZSelF2iOAJoRT2IZulRMtUV2fc01dT4C8kFAH25lCo38fe
 ZsjQtUU1fsSWU7sxYtqyJ7OXjSmXdiDvxwRGu37/fA6AlEtUiGA9UgF/bjhILneZfHLTIlWyvAL
 wgAjpbppxz3/NfY4Erc2LA8JNQen1bQHGNUGAH04rItzo4l7iygrKCRRZfiSufcIhMYc47ZozXp
 MttegjwnIeehbwL71NDcydvPt9rdN27ybsZXtSNDBttG0gz8XmMYSNSrlwGT3b7TIKhqumVy5bl
 Ubmw9h8HU
X-Received: by 2002:a05:6a21:50c:b0:1f5:6d00:ba03 with SMTP id
 adf61e73a8af0-1f56d00bc0amr21931890637.36.1741715078936; 
 Tue, 11 Mar 2025 10:44:38 -0700 (PDT)
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af543238621sm2069231a12.48.2025.03.11.10.44.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 10:44:38 -0700 (PDT)
Message-ID: <7d24d6c3-f868-41aa-bcb5-c8138a094327@linaro.org>
Date: Tue, 11 Mar 2025 10:44:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] arm/cpu: Store aa64dfr0/1 into the idregs array
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-8-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250311162824.199721-8-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: xMRvDtCRH9lQ

On 3/11/25 09:28, Cornelia Huck wrote:
> From: Eric Auger<eric.auger@redhat.com>
> 
> Signed-off-by: Eric Auger<eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---
>   target/arm/cpu-features.h | 16 ++++++++--------
>   target/arm/cpu.c          | 15 +++++----------
>   target/arm/cpu.h          |  2 --
>   target/arm/cpu64.c        |  4 ++--
>   target/arm/helper.c       |  4 ++--
>   target/arm/hvf/hvf.c      |  4 ++--
>   target/arm/internals.h    |  6 +++---
>   target/arm/kvm.c          | 12 +++++-------
>   target/arm/tcg/cpu64.c    | 33 +++++++++++++++++----------------
>   9 files changed, 44 insertions(+), 52 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
