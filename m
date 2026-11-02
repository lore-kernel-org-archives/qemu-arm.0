Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE853606A327
	for <qemu-arm@archiver.kernel.org>; Mon,  2 Nov 2026 10:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=SKtodSHp
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xNotD-0004L0-JX; Mon, 02 Nov 2026 05:03:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNose-0004Do-0k
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:03:11 -0500
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xNosb-0004RS-5G
 for qemu-arm@nongnu.org; Mon, 02 Nov 2026 05:03:07 -0500
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8ae8607e8afso19364917b3.3
 for <qemu-arm@nongnu.org>; Mon, 02 Nov 2026 02:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793613783; cv=none;
 d=google.com; s=arc-20260327;
 b=sXBB+/4S+87Pi8+Dla+Pz1NdD9WBJ8+j+EqRldezaXIcdEV6OVjjntLUcdumGmzlXW
 HW7w3mcmDN+MrCR1lNTTHRBgwl9+sX8KIF53+OC1QGZABX30w+ugBKLNa6SZjVDUNQlv
 4+x7NZgVZrFT6ZhpapRAYQnUh7Cg6zc/J4l1M2Sx6exliz7+91Y4lvA5L579bH/YfI+G
 lGjSAtpS6DJzy2Hj8t1pv6/F6B6QVz6lL9d6jBuv7KoHf2SHC0ExWeTsa8OOsuGKWeeX
 nDu6dwS5kQCl7Y/Va0lQRIpaGlWZgIQpaGBmB0FOv6+7PGx0Np0GdAH0VlECbuDqgAcR
 fTyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=0V1vKtG4hyuPDUwmCsjrtByO2owPckznkQwt8npQjWw=;
 fh=MnkEZ5EAi/sTfNwWFgVf1MG1zb2mdy/lwU211WNsO+s=;
 b=RFyfpICc5u4iW0DG4hgwuUSnK22k6ZhcTtIelsXN6IDfUxa56WaKEBnE//KCLdPmhF
 BrQ2/BXXTbDoigZCvfLUKAWUN3RMyignamT2YfqgN0eNTEjslqBCoaw1QDfCy+stPJ9l
 aArpexNG6uxYDEZSu+x5lwNXUeQ+vXVWdwV4pAzsuRhtdUgsXNrT/KLYZu+NMNub0Sb6
 ruB7Y1z49HKdF0oMuugVbcNVyivZ4axAijlCLWnFqBvHmRxCH6csOFyXAgfm2oSG0tq9
 raT4MTIRAcsG+AsDgQj56PHvpi/+2vkKqnxAi5jio+MbuZhbE1jw2ZTmgqhUlBMDGMSG
 k04A==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793613783; x=1794218583; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=0V1vKtG4hyuPDUwmCsjrtByO2owPckznkQwt8npQjWw=;
 b=SKtodSHpDL8KsHP9T3c8G936AQltw6w0seFloc/Sy4qIscaL9HERPwcRBD5gn9Sg5O
 LmbeAq21b89hzsED+dUG16UrzuDylopt1XYVdyxP/ahjUulSaxl5RemW1n1vgF7NLdhP
 /q116bYChuu4Ygzy536vEFeLuJVDsQHZf8yvAedGnMnKk9VBgf1nFksb6Bpr8aglfXYT
 cTMsylzxxbUOH+ZoxqTsSf9MmOX0QmAiDSYmUr4ynp5mhnLhAjSwvpg7OAfdqJNcjN14
 kk8+v3lITShDTiP5Z9UsgDyBqYjCNVSPD03ebNZ9ibSQt1QGRl4F9nGuG9yv+x5e9WHr
 ChQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793613783; x=1794218583;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=0V1vKtG4hyuPDUwmCsjrtByO2owPckznkQwt8npQjWw=;
 b=Sbc8rnHF/XHKFF+2bLkorIM9gy/M5mX9s3ghKm1I7OYXloZxNJxqrV9uns6WB/aUia
 1qAmJ5C0t2DpYyls0hfJ5btMwViKaL7PwmRxZpRXMqxuOV57v+5lvPrphGflZivfLcCz
 JMgLIzJpN0H0zEpXDQ8UnryPh1f5zI1kg3k+BKWgrLjiWG4VXJprJjwEgxmQpfeAIykt
 xWx5lZf2RX387izclcFYlZBZ3Rz+9DhSPPH1Vg6pLIqng6aOnmmQr1IFPToovkYJyfkU
 ++CfjfjCEjKwA0lBP43XZZJu6VROEifRVF3W8ZiJndGXCHeYBatE/Csk7RNfU+LS2LDN
 QgAA==
X-Forwarded-Encrypted: i=1;
 AKwUvByyj+EcnrSHfNZuu26Ia1cgbxLVYtUoRNRCJN+ISYT1vn5G3n7RnrQYkGvcRLmhZK4w1ZxYeJNM8A==@nongnu.org
X-Gm-Message-State: APuU4Z/v6mRRhZcj8+t3ZjOwU5gqycVFJ6gGwpdMiioOCAVbjc8xWQy0
 vnjWOioBr3ejy+lzG4XLslLnK0it887xgifoXdTazY4umo61qdtgtjqWzRHr0nl+cjE/S44HY8g
 Wa+v24RSuxKAkFc2qFd3FuNmNP5Qr1o/V2wI4NS4OJQ==
X-Gm-Gg: AYBFou2hgnwTcejZYCNP4M7ZnB9L1hFZt7WdF1CbZqx0HR7EhUupA1amJy5gce3jHKZ
 Q7WCdzcfyMhU3tmBH9jWyk7aaSt+Ui+XsOTcKWMSCP59yVPrOlfAJ57Wo6QwJGyifR3D+dfEpNx
 LefvgIjFRQMLjFaw9AeSsZjka7Z46lqwBmS3+AzV63SR7EvhxU4mkxUBJPWMQb0mltMmCkThr0H
 DVU1j1gJuclw4t6BO6CGMT3unlok6m6/bmk8IeZezDgE6AUN19+ESsliwMeuGwBKHDMdUQCuRBl
 7ke1VhUZ7epCdAPURZag7YYJJ2ZZDU4NPFnhs42rb/s+ZvguNQW7NUlpB/ybuAo54Q+oZi+QRia
 hZtumR/juNg62bjdwnF0jeRetng21t7GAeNYgnoialYhuj/onJ33XPyZWDJe2uWerbQ25wnTUj2
 ibfVzW2WZrCkwWSOKGG1TK
X-Received: by 2002:a05:690c:e3c3:b0:8b0:c8aa:d108 with SMTP id
 00721157ae682-8b2b675903dmr49450937b3.41.1793613782882; Mon, 02 Nov 2026
 02:03:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030131406.461599-1-eric.auger@redhat.com>
In-Reply-To: <20261030131406.461599-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 2 Nov 2026 10:02:51 +0000
X-Gm-Features: AclHuK-pzougyNW5YELHEwFwdIbt0EcKEyG0x8JeT_fXGTB3TsRnaKBbI-u18ak
Message-ID: <CAFEAcA92=yV3GFD7r+g4e3+j6aW_JYi7EZfxeSAwTp=Bip0Muw@mail.gmail.com>
Subject: Re: [PATCH v4 for-11.2 00/10] kvm/arm: Some refactoring for custom
 KVM host model
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 shaju.abraham@nutanix.com, khushit.shah@nutanix.com, 
 richard.henderson@linaro.org, pbonzini@redhat.com, skolothumtho@nvidia.com, 
 philmd@oss.qualcomm.com, 7746591750@163.com, maobibo@loongson.cn, 
 harshpb@linux.ibm.com, amachhiw@linux.ibm.com, 
 daniel.barboza@oss.qualcomm.com, milesg@linux.ibm.com, farman@linux.ibm.com, 
 cohuck@redhat.com, alireza.sanaee@huawei.com, armbru@redhat.com, 
 mbawa@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
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
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 13:14, Eric Auger <eric.auger@redhat.com> wrote:
>
> This series contains some patches initially introduced in
> "kvm/arm: Introduce a customizable aarch64 KVM host model" series
>
> They are rather independent on the actual custom host model and can
> be considered as a separate dependency. Would be nice to get some of them
> in 11.2.
>
> Can be found at:
> https://github.com/eauger/qemu/tree/arm-cpu-model-v11-prereq-v4

Applied to target-arm.next, thanks.

-- PMM

