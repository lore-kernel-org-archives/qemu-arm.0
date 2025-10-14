Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40665CCD193
	for <qemu-arm@archiver.kernel.org>; Tue, 14 Oct 2025 17:40:42 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v8j08-0006mV-5y; Tue, 14 Oct 2025 13:39:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1v8j06-0006m1-VQ
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 13:39:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1v8j03-00026m-UW
 for qemu-arm@nongnu.org; Tue, 14 Oct 2025 13:39:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760463588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hliqD4dhEXXuu2qUMeAR2zqCexonK+0uACESUm65DsI=;
 b=eCxQQwowTyY34SaYeAoYMf6q6gzTYlA2PZzUbRsaINjwEQZd7DEU4Jh7Tf7Ejg5p1UZPsB
 Fmc+Ob9RSouZ+nIQqHqOdfR5aHzidkb42fBIwr/JaIyH69hSTzwvz0JlHfO/K4YZtGoWn2
 9lR4W/BKRW1Jius9NEtMiTms7oE3KDQ=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-673-Kj4AurpiOYiaHLXJAkPo8g-1; Tue, 14 Oct 2025 13:39:46 -0400
X-MC-Unique: Kj4AurpiOYiaHLXJAkPo8g-1
X-Mimecast-MFC-AGG-ID: Kj4AurpiOYiaHLXJAkPo8g_1760463586
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-752eb824a20so105032577b3.1
 for <qemu-arm@nongnu.org>; Tue, 14 Oct 2025 10:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760463586; x=1761068386;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hliqD4dhEXXuu2qUMeAR2zqCexonK+0uACESUm65DsI=;
 b=ZqZYAu+I8CPmweFtPhINm3qfsJt5F/PuriJAP9EbylpjaLZ38NAFyo7UgfYRg22MZy
 plm7Kz4B6xYQ9hVsxOiKHTuOxEXy9pAUAg8/0VZt0NGszPRu8CzVmb3yFId7O+6KwtEK
 QeAdR8S/OqSPtyY4omliq/SqBXiTrkWEzLS1gnD7sm/D9f2sVjOFo2WUpBEQ48omQ0LP
 1jrUxncbIazUK0ai0zZGSWuiGWNk2Agl0QUrJPYi0I63tSX9GtCsDedhksVikNvIixIZ
 UwQRd+8dxzKeP7Ef2oxJ4h2F8lLrDPMcrYBD4DXhORZjS3DeEnNeamvP+ya4GdnnFgGN
 7xxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWwdIlX52A0zqnNkkrNjcaahiDEwsaz1fbt6i8730vTwtYoOU95I284XcK1QjCa8ryyXkHqSy6dgA==@nongnu.org
X-Gm-Message-State: AOJu0Yy74/Q5fy3dNL0iZxinZn0DsxkqewqzjidG9QkvK629MCx9D+iE
 8WtSVSwN6xUVrpY5FxVGVzt+BO9lwBEmD6tsRTq1AZnGaOtGNgb2qnvC6e1Zgz5hUgsRO/8cM/P
 vlIpwCDCKtJH/F4pJ5fkPT1PZioadSR67FlhHYH16zy6c926VpEHKfVe25wKHoxmyw5ArMnZd6w
 RWb4QxQfF5UiGTfAsFmQ2mJ+bp27ZP
X-Gm-Gg: ASbGncuvdyA6lB7eMls/Qbad+yaag2O18XA/1zcTDH4898XjzybZXcH/gSNKdP+OgWr
 C3d04/gg3K+mYRUxkl6x+1QVQMpFwq11uD+mJyIJyzRoNeejZUxZ6xNXgz1hWvGUPJjfRHiehhX
 uYLIkfweqhBxY5XOuYezHcLh7N2MoVByZ8KdfDFNmnY9zJIuS7biyK
X-Received: by 2002:a53:ec89:0:b0:629:9c6b:b3ab with SMTP id
 956f58d0204a3-63ccb825baamr16549529d50.1.1760463586127; 
 Tue, 14 Oct 2025 10:39:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvAZ3TlJumy+HFWgsNOzSn4+V/UatjmfATj0mAydNOUQQ5gO7+6JntTIRiCg6EuCyAe6kiiR8/Lb3wDRPMcBQ=
X-Received: by 2002:a53:ec89:0:b0:629:9c6b:b3ab with SMTP id
 956f58d0204a3-63ccb825baamr16549519d50.1.1760463585757; Tue, 14 Oct 2025
 10:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <20251002020432.54443-1-gustavo.romero@linaro.org>
 <20251002020432.54443-3-gustavo.romero@linaro.org>
In-Reply-To: <20251002020432.54443-3-gustavo.romero@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Oct 2025 13:39:34 -0400
X-Gm-Features: AS18NWCaWYZ4L6ElMmgO0jciDGRjpiOivPXm_Z1wMeZuFPvn8Yi1E1Fdm7RRPXY
Message-ID: <CAFn=p-bscu00jtyfm+SmeYqB7gt6eA+F8uuYb8ng6rTe_a=HTA@mail.gmail.com>
Subject: Re: [PATCH v5 2/9] python: Install pygdbmi in meson's venv
To: Gustavo Romero <gustavo.romero@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, alex.bennee@linaro.org, thuth@redhat.com, 
 berrange@redhat.com, qemu-arm@nongnu.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PhcM7w5c6qL_hk8Nh5RANHv7KtgPK6LE6iLRhC-fSD4_1760463586
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, Oct 1, 2025 at 10:09=E2=80=AFPM Gustavo Romero
<gustavo.romero@linaro.org> wrote:
>
> The upcoming changes in the reverse_debugging functional test to remove
> Avocado as a dependency will require pygdbmi for interacting with GDB,
> so install it in meson's venv (located in the build dir's pyvenv/).
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> ---
>  pythondeps.toml | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/pythondeps.toml b/pythondeps.toml
> index 16fb2a989c..98e99e7900 100644
> --- a/pythondeps.toml
> +++ b/pythondeps.toml
> @@ -33,3 +33,4 @@ sphinx_rtd_theme =3D { accepted =3D ">=3D0.5", installe=
d =3D "1.2.2" }
>
>  [testdeps]
>  qemu.qmp =3D { accepted =3D ">=3D0.0.3", installed =3D "0.0.3" }
> +pygdbmi =3D { accepted =3D ">=3D0.11.0.0", installed =3D "0.11.0.0" }
> --
> 2.34.1
>

Do we need to vendor pygdbmi? Currently, mkvenv does not consult
online sources and so if this package is missing, pulling in testdeps
will fail.

We can either:

(1) vendor pygdbmi, or
(2) change mkvenv arguments for the testdeps group specifically to
allow it to download missing deps.

--js


