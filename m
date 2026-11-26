Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C99D606A31E
	for <qemu-arm@archiver.kernel.org>; Thu, 26 Nov 2026 15:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jKBEQf6c
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xWb6R-0004xw-9B; Thu, 26 Nov 2026 10:09:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWb6P-0004xQ-Gy
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 10:09:37 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1xWb6M-0007qz-Fo
 for qemu-arm@nongnu.org; Thu, 26 Nov 2026 10:09:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4bb85e07aadso87951795e9.1
 for <qemu-arm@nongnu.org>; Thu, 26 Nov 2026 07:09:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1795705772; x=1796310572; darn=nongnu.org;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Tywsr03pAYQcTzE56HpjdIbc/rsi6UPJdZzlBYRdd1M=;
 b=jKBEQf6cv6OBgRB749/FxeZwFJpVkVhPopshrHQeM+cwzIf+Iq3b8kPMARoLjvNRF1
 xVUTuaRp40mKgtP7okSg9gw2TIRjqAgA/ED2/IgZd8jEYR28Rle4J168RDckm/ivX+zL
 9LH/4xvOzorr8AIKRbrfj1XwH6zV2TBd1Ohn+CHMBqbI+6j/HM/z36OILBi7x266kGiv
 n3AU28FqqwRMi2EMW43W4993bwnU//BQ8AQdRzwXlxfUJNbOL1dzPIPLx++LYagXsFvv
 JLklJdNEWeF6rIA/O1aGB6nMJ1i2wMDvLthCQtV02PaYkigl5ZeAoBNJcZWx7vfhbwc7
 qD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795705772; x=1796310572;
 h=content-transfer-encoding:content-type:mime-version:message-id:date
 :user-agent:references:in-reply-to:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Tywsr03pAYQcTzE56HpjdIbc/rsi6UPJdZzlBYRdd1M=;
 b=GUvDB3PlIwakHkdxYiQS1mQNkQu1OTP3eSuu9Fznk06bjFW9CK+38EEPOA8vMC9k5N
 oRC43m2VqhEsbkfM6Vn5eAj3HcYekab68GbshrU98zI7Nnbej2mowplh67CkUwtq6nBC
 dRH5EdrilWVp8fRvFWQNvRBIvfNjqJSewfJ909P+iWByAOMai7ag4rFHE66DbZjXePSI
 +6+jvkMjkall+efUtOzwKFth+1dPnhCD0BJMTOvttkXQy9GNCl3jB0xEvuF2QEya377/
 F4TGst9mYRwiMxkLnjdH9JabAkQUXad53TMA2d9idvE8+Y2AGmz8XEOmawmLXS9DfJWt
 BchQ==
X-Forwarded-Encrypted: i=1;
 AL+hErH21AoNy7jO48oTEkqjKm2JqJDi8aM4XXns5kYj+L3AG/o/7xu0QbpTSob4PF2L2ep0EHTM+VlAWw==@nongnu.org
X-Gm-Message-State: APuU4Z+AA0Xh+NPfdYDCimMDwBmlr6OuLx68qCpMwClHqVQq753NLMEi
 Moxv+uNll7J1CTLJ/Vin7H72p4QtJbHg6j5Bxy2JqxcsyiAtc+P6Fx3xmDFoqVHlST4=
X-Gm-Gg: AZFdTZco6Ap0EkeS3JpB8TOhHDSa0bYTZy7cWK94rh+2C3Jo5yUIxIKp9D6hzVFEA5L
 Ttl+jwyA4xqNI0hR0v43fkaq7UrzCDD0nq6FUQmzl2xs1X6nbzNoDjuNjMjLN3Qg9A1BEVKUDzK
 XavS2J67KKKelC+XaGarRJ8fwMYJECTsrmTeZh4haEqQE2X9ZDZLWsQG7aUqSMMn5v1TFrW2sJG
 UxAweysXGqIyjy94cRbD1Nn8ijB4g37WDW/ojZkxUSo1rWgaKzWyyOVPkkK5b9Ae1y9qS+uy1i1
 Run4Grf3uwpOctBGpJU+g6PnJHe3FAUFVPblqb6nJPcnrwspCRQZ9ChKadXBqnRUoVF0ONp09I/
 s52djT6EMp/1NQE2WmC4DQEftFyGE+1UWg8X0yAHBd7bzTfdpUHKFYkpVxPkhtM+lf3vO5YG3MM
 Ccxi9Ar2n+nN/7rqJYZ1CokkrdB4VJaRT69VlTGMUKT5nrys2iWClV0WqqfKTDjX501qngQvTUj
 4bM1DV20rATszxhgN9/bgABrPIdsx11qifW6wxFqovB5H5obSusk1REmnNW46xOfNKpUII/y+rE
 D54bB4tw3nmznHanEnw33WXV0ASPZu6WG5ZLlJwi1+psDJTbNQ==
X-Received: by 2002:a05:600c:638f:b0:4aa:2339:a375 with SMTP id
 5b1f17b1804b1-4bb8880607cmr403779665e9.13.1795705772568; 
 Thu, 26 Nov 2026 07:09:32 -0800 (PST)
Received: from draig.lan ([185.124.0.158]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb853a12acsm640166855e9.8.2026.11.26.07.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2026 07:09:31 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id F01B95F885;
 Thu, 26 Nov 2026 15:09:29 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Frank Mehnert <frank.mehnert@gmail.com>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org,  peter.maydell@linaro.org,
 Frank Mehnert <frank.mehnert@kernkonzept.com>
Subject: Re: [PATCH for-11.2 v2 2/2] tests/tcg/aarch64: test WFE after a
 failed store-exclusive
In-Reply-To: <20261126143258.1056688-3-frank.mehnert@kernkonzept.com> (Frank
 Mehnert's message of "Thu, 26 Nov 2026 15:32:58 +0100")
References: <20261126143258.1056688-1-frank.mehnert@kernkonzept.com>
 <20261126143258.1056688-3-frank.mehnert@kernkonzept.com>
User-Agent: mu4e 1.14.5-pre2; emacs 30.1
Date: Thu, 26 Nov 2026 15:09:29 +0000
Message-ID: <87qzg7tys6.fsf@draig.linaro.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Frank Mehnert <frank.mehnert@gmail.com> writes:

> Add a test case for the common spin lock pattern "WFE, load-exclusive,
> store-exclusive, on failure back to WFE", where the lock is released by
> a plain store and without SEV.
>
> CPU 0 executes LDAXR on the free lock, then CPU 1 takes the lock with
> a plain store. The following STXR of CPU 0 must fail, and the WFE after
> it must complete at once because the store of CPU 1 cleared the global
> monitor of CPU 0, which generates a WFE wakeup event. The virtual
> timer interrupt, 1s out, ends a WFE that misses the event, so the test
> fails instead of hanging.
>
> The test starts CPU 1 through PSCI and therefore needs two CPUs.
>
> Signed-off-by: Frank Mehnert <frank.mehnert@kernkonzept.com>

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

