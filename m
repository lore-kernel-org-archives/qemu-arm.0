Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1019467ejn;
        Fri, 21 Oct 2022 03:09:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM56jgkpobhZqTFkVnqOf5rnVPI6m6ihhuxncY36YkVu/i3uGLTH0Nz4IYkxeb5Vxjg6bsOm
X-Received: by 2002:a05:620a:4720:b0:6ee:dc2d:4729 with SMTP id bs32-20020a05620a472000b006eedc2d4729mr12515075qkb.36.1666346993869;
        Fri, 21 Oct 2022 03:09:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666346993; cv=none;
        d=google.com; s=arc-20160816;
        b=bifFZbGthceC5qJxur3Nqr/g6HjbxvUmeQ2OsbUfb4ud5Md7d4svZWGxfftqy5TV0e
         vDmlcFmfdIhPjhlLj/tfO/OZcP1ePggCEGTJ5PA5jA/kovyj6vardPwqscG8FWyWJNIy
         L8snbRUKuzLJIDcR6U1GZBmn7nEcHugvQ6AJK8Tpo5vJdxwr43FUJ52nRUh68k/IiOOK
         TFr7+BTjMwNSBwEvO1GWfBwq97N72XYvl67Eemlp5nN2+JYWIvo2iu/LRcwjthBlkrDh
         2wPSUSVdldG9kQ9C8PgGBAGWVSO2g26dOR9MQBtJ0HsKXeyP3WXiNy+7H8eWt6LQFtKU
         9wxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=De6goZ7JkJ3YLqvW+bgz0dCp6u4aYLJy+OozOnLn8Gs=;
        b=GI62QgFuRUmoKkIEwOvE7/sHYZBTe2EZCGJ8eE8+iKc6z2K59KYshg+QixkhqbPPTm
         s8L56gQyeriH8pT8JXlBm3AnHv1d7yT4zGvzWD0ouSTy2IFGuXZCsoBQmsQ/enJxNZET
         ktuupJX/P8BLGycfTbJgnBu475lWkwiFFkY20Sg194KeNIHrpaxXNDtvoGCAcVIIB6E6
         fQkKQV4qYY542/c3LDbrxC1uOper1/9yk4JP4aHUONetMTZ0wouZo7ciu9WkFclL7BCn
         NncTD6TB70qlABjNiqjS1TZNc27p2pNYztRjsQAmRksqP7PGRB7Nu9KGpwsRG4aR+zAW
         amtw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sWQ0M2np;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id do48-20020a05620a2b3000b006eeeb3ed651si7538229qkb.284.2022.10.21.03.09.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 03:09:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=sWQ0M2np;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oloyN-0008UP-Fc
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 06:09:51 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oloW3-0007Qx-Cg
	for alex.bennee@linaro.org; Fri, 21 Oct 2022 05:40:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oloW0-0007I1-EP
 for qemu-arm@nongnu.org; Fri, 21 Oct 2022 05:40:32 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oloVy-0007yb-QR
 for qemu-arm@nongnu.org; Fri, 21 Oct 2022 05:40:32 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 x1-20020a17090ab00100b001fda21bbc90so6130327pjq.3
 for <qemu-arm@nongnu.org>; Fri, 21 Oct 2022 02:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=De6goZ7JkJ3YLqvW+bgz0dCp6u4aYLJy+OozOnLn8Gs=;
 b=sWQ0M2npDN5B2FIkmFjPdt8EnYt3HyWOU8gt+esKN4O5krXqRx8MFY3SsZ3hRzj4Q2
 C0EVABdwr8QTPwe8FEdQmDEl8+0oHUxB0tbpCZ6gaY4/K7zw4kSFNkQ1uCzIqUcTo/2q
 NU/XmXXKZH0Xok/pslnb+Dbv+pZTP1wNyGIT6n/umx3sMNvA6Oyd7JpPkaPzr4iwxPBr
 CLZOlPfBmbdTKAa0XWJeO3Gb/tzli3c6pP+8U3Hl3xClNeZ6gkb7QP6gqwIVmjhS/3Ep
 Uq/GAoWei01QDo8Y4jp1nr2EOX1pLV/mnkrHS42erQeItAFGQjzuFvQS76L6JoCjraQ/
 4jfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=De6goZ7JkJ3YLqvW+bgz0dCp6u4aYLJy+OozOnLn8Gs=;
 b=2XntTEilR8B01H6IT8QckSBlM8c2yqsVHg7usClat8yfUldnyVqr19hRb/7ausKw72
 7dUB8UbBXixUagMKUkE5+iEJgg/pXgMXny7A3Hf0DCt0KyjzcBrCMU/Q9VFWUIRRUQfQ
 18F2WKaIA3i4g0RTcYBkLF1XTTk6iA2uumOP+lrJVOSlO2fRuuDK8iRcZc+/YE0Fc8R+
 ixokIbAMHB2zBygT4IZHtckJtAUXXzCoOuZsv0KVZmiD0WKOgPfyw14cb7c/YYqJzdtT
 foPtz3uL38Ga5/wf0rjE6cpzQWpCYNZTB9lI/8B0SWwodpSQq+D/wHumWdn8tskOxwLs
 w+ig==
X-Gm-Message-State: ACrzQf3XL0gZ1DG3xNKG9hEtaC5Mgt+YqCOysKuwSSB8lVabNF1njz6a
 nBAynpufzRPfNypRslgjAg5vaxrT93VjijY8xc0c6A==
X-Received: by 2002:a17:902:7c97:b0:17f:5abf:9450 with SMTP id
 y23-20020a1709027c9700b0017f5abf9450mr17826192pll.19.1666345228832; Fri, 21
 Oct 2022 02:40:28 -0700 (PDT)
MIME-Version: 1.0
References: <20221020223548.2310496-1-richard.henderson@linaro.org>
 <20221020223548.2310496-10-richard.henderson@linaro.org>
 <1eda418c-61e1-a00a-1217-0ab2eaff0ae0@linaro.org>
In-Reply-To: <1eda418c-61e1-a00a-1217-0ab2eaff0ae0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Oct 2022 10:40:17 +0100
Message-ID: <CAFEAcA9E=-r6P6hR_E9VAjek+kbP=h1vp4hH6scXvprwzg67ng@mail.gmail.com>
Subject: Re: [PATCH v5 09/14] target/arm: Don't shift attrs in
 get_phys_addr_lpae
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aKhjB9Ro5ZQi

On Fri, 21 Oct 2022 at 10:27, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 21/10/22 00:35, Richard Henderson wrote:
> > Leave the upper and lower attributes in the place they originate
> > from in the descriptor.  Shifting them around is confusing, since
> > one cannot read the bit numbers out of the manual.  Also, new
> > attributes have been added which would alter the shifts.
> >
> > Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >   target/arm/ptw.c | 31 +++++++++++++++----------------
> >   1 file changed, 15 insertions(+), 16 deletions(-)
>
> >       if (regime_is_stage2(mmu_idx)) {
> >           ns =3D mmu_idx =3D=3D ARMMMUIdx_Stage2;
> > -        xn =3D extract32(attrs, 11, 2);
> > +        xn =3D extract64(attrs, 54, 2);
>
> 54 -> 53?

Yes. I spotted that in review of v3 but I guess we lost the fix
along the way somewhere.

-- PMM
