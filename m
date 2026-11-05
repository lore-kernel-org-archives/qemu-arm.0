Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89B51606D807
	for <qemu-arm@archiver.kernel.org>; Thu,  5 Nov 2026 15:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HUmy6b9R
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xOzPQ-0005Ea-Tz; Thu, 05 Nov 2026 10:29:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1xOzPP-0005DO-1T
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 10:29:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kkostiuk@redhat.com>)
 id 1xOzPM-00012o-Gv
 for qemu-arm@nongnu.org; Thu, 05 Nov 2026 10:29:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1793892582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WnyEFMD5bKu5clECubxywcLnBEDqdA+HPkHOPDgjFAM=;
 b=HUmy6b9R3RCFVPzoGi7k+C9A+/thvP+b7JtaVHNWetySugEx1B/KCDAs8ZQ2YkKeaq0LxC
 0wblYhL7AVQPc8nPiiJvMQT05m2fCwspXdvsIfz0CoLZyTSDAZraL6cZA50SeCY3YUzCi3
 4qUMMMZJhuC2x28F5IpKTIW96QofRhw=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-2FQp03c8MIuWc47fAGGlvg-1; Thu, 05 Nov 2026 10:29:41 -0500
X-MC-Unique: 2FQp03c8MIuWc47fAGGlvg-1
X-Mimecast-MFC-AGG-ID: 2FQp03c8MIuWc47fAGGlvg_1793892580
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91e8badc80fso23835046d6.0
 for <qemu-arm@nongnu.org>; Thu, 05 Nov 2026 07:29:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793892580; x=1794497380;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=WnyEFMD5bKu5clECubxywcLnBEDqdA+HPkHOPDgjFAM=;
 b=gb1fhBW0oOiIx1mSUkC8lm5xxS2tilUlBXSchfssnXOJBPLuyXvRuyT8WuWQkc64c/
 49JJzZNtMmEg1JOaIQxLt2COQDbb0ty3TrW20MB1d60e184VBwdlhkxO16vB0apkap42
 5hVj8CVj80Q/Pwi74ts7+u0QIP0sPKCY20F1BlwXQSpq9X7/fx+4IhxSs2lylEcYYZL7
 ZcnenY9MlVQyhU/K1xJ5zHroll5LT0Vho1nl1AmNktVri3L8jNdmmQeBFMn0AWhg+bAZ
 cmJaLkgvIxOKJqCeZVx8QNPJsNOHNbRu+uP8/itHrgeFqo5wKEUuV92DYjjAi9zDGPfL
 31QQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByl/D4oPpegjKUDlVHP/Aq/mGFC6e0W/kBp24uwSmwVTnEx/E0jsbgam/viumGraCEZZ/2mcL6+TA==@nongnu.org
X-Gm-Message-State: APuU4Z8SiIeS4rahQF5Qr3hIQ0AZtGrzQh6/DzmvfWQJQZiqQvXC4dnG
 2cJAazulAJpVty8+KR2J7MlKHlqdXglwnLWhTBsi8p+WlNvg10t1dWsxGI0CI5jIbfPEgcg/DxI
 ryYST4oOq7IcU0RmKMdOlFA5qnWr1Cv1ggcxnhzRhwgOgwLXArvgAnRI709lcy3nBWU8Tt4uevv
 4FTkzywRx/ZdoL3JARBgQMLkWz5hur
X-Gm-Gg: AYBFou3lDTwW1AkVMwr0pyDdg04HS3vu7FqSHF0rJ4yiXSFikBpTqVg9UuvXRx18koR
 78T+P8F5iHge4eOkucBHJSDdpYcG5fR7x2WJsI2gMZIO2ZHTlxHudPncsO1Ub/hEHyHJPzK5ghU
 3GIPNM/Jf1uBkptPpWuO20bblnLmyofxI0o6hWn9MXWAEC5t4JQ3dPR68KbQ9cu13fdHNsDnxGq
 2vYjSxvH+l/kXD1+77eZM92bqWuMVjJhDcuXgHHkdCuei3lswm1wNdy1bmoY8koCmGtWbaPoA==
X-Received: by 2002:ad4:4eaa:0:b0:91c:6d30:7c2c with SMTP id
 6a1803df08f44-91ca4ba3932mr328995836d6.52.1793892579671; 
 Thu, 05 Nov 2026 07:29:39 -0800 (PST)
X-Received: by 2002:ad4:4eaa:0:b0:91c:6d30:7c2c with SMTP id
 6a1803df08f44-91ca4ba3932mr328995466d6.52.1793892579079; Thu, 05 Nov 2026
 07:29:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105125203.40320-1-philmd@oss.qualcomm.com>
 <20261105125203.40320-18-philmd@oss.qualcomm.com>
In-Reply-To: <20261105125203.40320-18-philmd@oss.qualcomm.com>
From: Kostiantyn Kostiuk <kkostiuk@redhat.com>
Date: Thu, 5 Nov 2026 17:29:28 +0200
X-Gm-Features: AclHuK9F8ds1NUnep_sO2MDvEwiSehpgOjMaN3-jEOZwX-8jeVoCgePKPh3_RVQ
Message-ID: <CAPMcbCrrqrBf_7ofh1S=c=2DFTpZf1SjaqEYnVM=miKbSCk-FA@mail.gmail.com>
Subject: Re: [PATCH v2 17/17] qga/vss-win32: Replace deprecated sprintf() by
 StrCatBuffA()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, 
 qemu-ppc@nongnu.org, Michael Roth <michael.roth@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4ISIr8dTdS7b5Bo8bhQm8HJuLe1LCg3EHfmxU27-Q8s_1793892580
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f11ab3065f892969"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kkostiuk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000f11ab3065f892969
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 2:54=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <
philmd@oss.qualcomm.com> wrote:

> Formatting is not necessary, replace the deprecated
> sprintf() by StrCpyNA() and StrCatBuffA() calls.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  qga/vss-win32/install.cpp | 17 ++++++++++++-----
>  1 file changed, 12 insertions(+), 5 deletions(-)
>
> diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp
> index df00588c923a..1a3d5cbf75d5 100644
> --- a/qga/vss-win32/install.cpp
> +++ b/qga/vss-win32/install.cpp
> @@ -562,7 +562,8 @@ STDAPI DllRegisterServer(void)
>
>      /* Add this module to registry */
>
> -    sprintf(key, "CLSID\\%s", g_szClsid);
> +    StrCpyNA(key, "CLSID\\", sizeof(key));
> +    StrCatBuffA(key, g_szClsid, sizeof(key));
>

MSFT does not recommend to use StrCatBuffA due to security warning.
What about using StringCchCatA instead of snprintf, even in this case?


>      if (!CreateRegistryKey(key, NULL, g_szClsid)) {
>          goto out;
>      }
> @@ -572,7 +573,9 @@ STDAPI DllRegisterServer(void)
>          goto out;
>      }
>
> -    sprintf(key, "CLSID\\%s\\InprocServer32", g_szClsid);
> +    StrCpyNA(key, "CLSID\\", sizeof(key));
> +    StrCatBuffA(key, g_szClsid, sizeof(key));
> +    StrCatBuffA(key, "\\InprocServer32", sizeof(key));
>      if (!CreateRegistryKey(key, NULL, dllPath)) {
>          goto out;
>      }
> @@ -581,7 +584,9 @@ STDAPI DllRegisterServer(void)
>          goto out;
>      }
>
> -    sprintf(key, "CLSID\\%s\\ProgID", g_szClsid);
> +    StrCpyNA(key, "CLSID\\", sizeof(key));
> +    StrCatBuffA(key, g_szClsid, sizeof(key));
> +    StrCatBuffA(key, "\\ProgID", sizeof(key));
>      if (!CreateRegistryKey(key, NULL, g_szProgid)) {
>          goto out;
>      }
> @@ -590,7 +595,8 @@ STDAPI DllRegisterServer(void)
>          goto out;
>      }
>
> -    sprintf(key, "%s\\CLSID", g_szProgid);
> +    StrCpyNA(key, g_szProgid, sizeof(key));
> +    StrCatBuffA(key, "\\CLSID", sizeof(key));
>      if (!CreateRegistryKey(key, NULL, g_szClsid)) {
>          goto out;
>      }
> @@ -651,7 +657,8 @@ STDAPI DllUnregisterServer(void)
>          errmsg(hr, "CoCreateInstance(VSSCoordinator) failed");
>      }
>
> -    sprintf(key, "CLSID\\%s", g_szClsid);
> +    StrCpyNA(key, "CLSID\\", sizeof(key));
> +    StrCatBuffA(key, g_szClsid, sizeof(key));
>      SHDeleteKey(HKEY_CLASSES_ROOT, key);
>      SHDeleteKey(HKEY_CLASSES_ROOT, g_szProgid);
>
> --
> 2.55.0
>
>

--000000000000f11ab3065f892969
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 5, =
2026 at 2:54=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:p=
hilmd@oss.qualcomm.com">philmd@oss.qualcomm.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">Formatting is not necessary,=
 replace the deprecated<br>
sprintf() by StrCpyNA() and StrCatBuffA() calls.<br>
<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@oss=
.qualcomm.com" target=3D"_blank">philmd@oss.qualcomm.com</a>&gt;<br>
---<br>
=C2=A0qga/vss-win32/install.cpp | 17 ++++++++++++-----<br>
=C2=A01 file changed, 12 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/qga/vss-win32/install.cpp b/qga/vss-win32/install.cpp<br>
index df00588c923a..1a3d5cbf75d5 100644<br>
--- a/qga/vss-win32/install.cpp<br>
+++ b/qga/vss-win32/install.cpp<br>
@@ -562,7 +562,8 @@ STDAPI DllRegisterServer(void)<br>
<br>
=C2=A0 =C2=A0 =C2=A0/* Add this module to registry */<br>
<br>
-=C2=A0 =C2=A0 sprintf(key, &quot;CLSID\\%s&quot;, g_szClsid);<br>
+=C2=A0 =C2=A0 StrCpyNA(key, &quot;CLSID\\&quot;, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, g_szClsid, sizeof(key));<br></blockquote><d=
iv><br></div><div>MSFT does not recommend=C2=A0to use=C2=A0StrCatBuffA due =
to security warning.</div><div>What about using=C2=A0StringCchCatA instead =
of snprintf, even in this case?</div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
=C2=A0 =C2=A0 =C2=A0if (!CreateRegistryKey(key, NULL, g_szClsid)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -572,7 +573,9 @@ STDAPI DllRegisterServer(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 sprintf(key, &quot;CLSID\\%s\\InprocServer32&quot;, g_szClsi=
d);<br>
+=C2=A0 =C2=A0 StrCpyNA(key, &quot;CLSID\\&quot;, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, g_szClsid, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, &quot;\\InprocServer32&quot;, sizeof(key));=
<br>
=C2=A0 =C2=A0 =C2=A0if (!CreateRegistryKey(key, NULL, dllPath)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -581,7 +584,9 @@ STDAPI DllRegisterServer(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 sprintf(key, &quot;CLSID\\%s\\ProgID&quot;, g_szClsid);<br>
+=C2=A0 =C2=A0 StrCpyNA(key, &quot;CLSID\\&quot;, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, g_szClsid, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, &quot;\\ProgID&quot;, sizeof(key));<br>
=C2=A0 =C2=A0 =C2=A0if (!CreateRegistryKey(key, NULL, g_szProgid)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -590,7 +595,8 @@ STDAPI DllRegisterServer(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 sprintf(key, &quot;%s\\CLSID&quot;, g_szProgid);<br>
+=C2=A0 =C2=A0 StrCpyNA(key, g_szProgid, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, &quot;\\CLSID&quot;, sizeof(key));<br>
=C2=A0 =C2=A0 =C2=A0if (!CreateRegistryKey(key, NULL, g_szClsid)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto out;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
@@ -651,7 +657,8 @@ STDAPI DllUnregisterServer(void)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errmsg(hr, &quot;CoCreateInstance(VSSCoor=
dinator) failed&quot;);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 sprintf(key, &quot;CLSID\\%s&quot;, g_szClsid);<br>
+=C2=A0 =C2=A0 StrCpyNA(key, &quot;CLSID\\&quot;, sizeof(key));<br>
+=C2=A0 =C2=A0 StrCatBuffA(key, g_szClsid, sizeof(key));<br>
=C2=A0 =C2=A0 =C2=A0SHDeleteKey(HKEY_CLASSES_ROOT, key);<br>
=C2=A0 =C2=A0 =C2=A0SHDeleteKey(HKEY_CLASSES_ROOT, g_szProgid);<br>
<br>
-- <br>
2.55.0<br>
<br>
</blockquote></div></div>

--000000000000f11ab3065f892969--


